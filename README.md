# UCMRS
Simulation studies of the general performance of the MR Steiger approach under unmeasured confounding. 

## Installation
```
install.packages("devtools") # devtools must be installed first
install.packages("psych") # if not already installed 

devtools::install_github("SharonLutz/UCMRS")
```
## Input
For n subjects (input n) and a specified number of simulations (input nSim), the SNP g and the unmeasured confounder u are generated from normal distributions with user specified means and variances (input gMu,gVar,uMu,uVar). phenotype 1 x and phenotype 2 y are generated such that

E\[X \] = &alpha;<sub>1</sub> +  &beta;<sub>g</sub> g +  &beta;<sub>U1</sub> U<sub>1</sub> + &epsilon;<sub>1</sub>

E\[Y \] = &alpha;<sub>2</sub> +  &beta;<sub>x</sub> x +  &beta;<sub>U2</sub> U<sub>2</sub> + &epsilon;<sub>2</sub>

where the intercepts (input alpha1 and alpha2), the genetic effect size (input betaG), the effect of the unmeasured confounder on phenotype 1 x (input betaU1), and the effect of x on y (input betaX) are specified by the user as single values. The effect of the unmeasured confounder on phenotype 2 y (input betaU2) can be a single value or a vector. The random errors &epsilon;<sub>1</sub> and &epsilon;<sub>2</sub> are generated from standard normal distributions with specified means and variances (input epsilon1Mu, epsilon1Var, epsilon2Mu, epsilon2Var). 


## Output
This function outputs the percent of simulations where the cor(g,x)<cor(g,y) and the incorrect direction is detected between X and Y using the MR Steiger approach. 

## Example:
Consider an example with 10000 subjects (input n=1e+05), the SNP g, the unmeasured confounder u, and the random errors  &epsilon;<sub>1</sub> and &epsilon;<sub>2</sub> are generated from standard normal distributions. x and y are generated from the equations above such that the intercepts equal 0 (i.e. &alpha;<sub>1</sub>=0 and &alpha;<sub>2</sub>=0), the genetic effect size, &beta;<sub>g</sub>=1, and the effect of x on y, &beta;<sub>x</sub>=1. Consider &beta;<sub>U1</sub>= -5 and vary &beta;<sub>U2</sub> from 0 to 11. The code to run this example is below.

```
library(UCMRS)
results<-UCMRS(nSim = 100, n = 1e+05, gMu = 0, gVar = 1, uMu = 0, uVar = 1, 
      alpha1 = 0, betaG = 1, betaU1 = -5, epsilon1Mu = 0, epsilon1Var = 1, 
      alpha2 = 0, betaX = 1, betaU2 = c(0,1,9,10,11), epsilon2Mu = 0, epsilon2Var = 1, 
      seedVal = 100, alpha = 0.05)

results$matrix
```

The function outputs the following matrix. 
```
     betaU2 var(x)>var(y) cor(g,x)<cor(g,y) WrongDir  cwd
[1,]      0             0              0.00     0.00 0.00
[2,]      1             1              1.00     1.00 1.00
[3,]      9             1              1.00     1.00 1.00
[4,]     10             0              0.32     0.15 0.15
[5,]     11             0              0.00     0.00 0.00
```
## Reference:

Lutz SM, Voorhies K, Wu AC, Hokanson J, Vansteelandt S, Lange C. The influence of unmeasured confounding on the MR Steiger approach. Genet Epidemiol. 2022 Mar;46(2):139-141. PMID:35170805; PMCID:PMC8915443.
