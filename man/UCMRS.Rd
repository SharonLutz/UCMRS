\name{UCMRS}
\alias{UCMRS}
\title{UCMRS}
\description{
The UCMRS package runs the UCMRS function which, using simulations, examines the correlation, variance, and causal direction under different scenarios as specified by the user.
}

\usage{
UCMRS(nSim = 500, n = 1e+05, gMu = 0, gVar = 1, uMu = 0, uVar = 1, alpha1 = 0, betaG = 1, betaU1 = -5, epsilon1Mu = 0, epsilon1Var = 1, alpha2 = 0, betaX = 1, betaU2 = c(seq(0, 11, by = 1)), epsilon2Mu = 0, epsilon2Var = 1, seedVal = 100, alpha = 0.05)
}

\arguments{
  \item{nSim}{
nSim is the number of simulations to run for the function.
}
  \item{n}{
n is
}
  \item{gMu}{
gMu is
}
  \item{gVar}{
gVar is
}
  \item{uMu}{
uMu is
}
  \item{uVar}{
uVar is
}
  \item{alpha1}{
alpha1 is
}
  \item{betaG}{
betaG is
}
  \item{betaU1}{
betaU1 is
}
  \item{epsilon1Mu}{
epsilon1Mu is
}
  \item{epsilon1Var}{
epsilon1Var is
}
  \item{alpha2}{
alpha2 is
}
  \item{betaX}{
betaX is
}
  \item{betaU2}{
betaU2 is
}
  \item{epsilon2Mu}{
epsilon2Mu is
}
  \item{epsilon2Var}{
epsilon2Var is
}
  \item{seedVal}{
seedVal is
}
  \item{alpha}{
alpha is
}
}

\value{
A matrix of results is returned by the function. The results include (1) the value of betaU2 used for the simulations, (2) the proportion of simulations where the variance of X was greater than the variance of Y, (3) the proportion of simulations where the correlation of G and X was less than the correlation of G and Y, (4) the proportion of simulations where the wrong causal direction was returned, and (5) the proportion of simulations where the wrong causal direction was returned and the correlation of X and G was less than the correlation of Y and G.

}

\author{
Sharon Lutz
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


