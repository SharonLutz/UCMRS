\name{UCMRS}
\alias{UCMRS}
\title{UCMRS}
\description{
The UCMRS package runs the UCMRS function which, using simulations, 
  examines the correlation, variance, and causal direction for the MR Stieger approach under different scenarios of unmeasured confounding  
  as specified by the user.
}

\usage{
UCMRS(nSim = 500, n = 1e+05, gMu = 0, gVar = 1, uMu = 0, uVar = 1, 
      alpha1 = 0, betaG = 1, betaU1 = -5, epsilon1Mu = 0, epsilon1Var = 1, 
      alpha2 = 0, betaX = 1, betaU2 = c(seq(0, 11, by = 1)), epsilon2Mu = 0, epsilon2Var = 1, 
      seedVal = 100, alpha = 0.05)
}

\arguments{
  \item{nSim}{
nSim is the number of simulations to run for the function.
}
  \item{n}{
n is the sample size.
}
  \item{gMu}{
gMu is the mean for the SNP G which is generated from a normal distribution with mean gMu and variance gVar.
}
  \item{gVar}{
gVar is the variance for the SNP G which is generated from a normal distribution with mean gMu and variance gVar.
}
  \item{uMu}{
uMu is the mean for the unmeasured confounder U which is generated from a normal distribution with mean gMu and variance gVar.
}
  \item{uVar}{
uVar  the variance for the unmeasured confounder U which is generated from a normal distribution with mean gMu and variance gVar.
}
  \item{alpha1}{
alpha1 is for generating the phenotype 1 X such that X<-alpha1+betaG*G+betaU1*U+epsilon1
}
  \item{betaG}{
betaG is for generating the phenotype 1 X such that X<-alpha1+betaG*G+betaU1*U+epsilon1
}
  \item{betaU1}{
betaU1 is for generating the phenotype 1 X such that X<-alpha1+betaG*G+betaU1*U+epsilon1
}
  \item{epsilon1Mu}{
epsilon1Mu is the mean for epislon1 which is generated from a normal distirbution.
}
  \item{epsilon1Var}{
epsilon1Var is the variance for epislon1 which is generated from a normal distirbution.
}
  \item{alpha2}{
alpha2 is for generating the phenotype 2 Y such that Y<-alpha2+betaX*X+betaU2[bb]*U+epsilon2
}
  \item{betaX}{
betaX is for generating the phenotype 2 Y such that Y<-alpha2+betaX*X+betaU2[bb]*U+epsilon2
}
  \item{betaU2}{
betaU2 is for generating the phenotype 2 Y such that Y<-alpha2+betaX*X+betaU2[bb]*U+epsilon2
}
  \item{epsilon2Mu}{
epsilon2Mu is the mean for epislon2 which is generated from a normal distirbution.
}
  \item{epsilon2Var}{
epsilon2Var is the variance for epislon2 which is generated from a normal distirbution.
}
  \item{seedVal}{
seedVal is the seed value.
}
  \item{alpha}{
alpha is the significance level.
}
}

\value{
A matrix of results is returned by the function. 
The results include (1) the value of betaU2 used for the simulations, 
(2) the proportion of simulations where the estimated variance of X was greater than the variance of Y, 
(3) the proportion of simulations where the estimated correlation of G and X was less than the correlation of G and Y, 
  (4) the proportion of simulations where the wrong causal direction was returned, and 
  (5) the proportion of simulations where the wrong causal direction was returned and the correlation of X and G was less than the correlation of Y and G (cwd).

}

\author{
Sharon Lutz, Kirsten Voorhies
}

\section{Warning}{library(psych) is required to run this function.} 

\examples{
testUCMRS <- UCMRS(nSim = 500, n = 1e+05, gMu = 0, gVar = 1, uMu = 0, 
    uVar = 1, alpha1 = 0, betaG = 1, betaU1 = -5, epsilon1Mu = 0, 
    epsilon1Var = 1, alpha2 = 0, betaX = 1, betaU2 = c(seq(0, 11, by = 1)), 
    epsilon2Mu = 0, epsilon2Var = 1, seedVal = 100, alpha = 0.05) 
testUCMRS
}


\keyword{ Unmeasured Confounding }


