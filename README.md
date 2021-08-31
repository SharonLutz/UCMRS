# UCMRS
Examing the role of unmeasured confounding in the MR Steiger approach

## Installation
```
install.packages("devtools") # devtools must be installed first
install.packages("psych") # if not already installed 

devtools::install_github("SharonLutz/UCMRS")
```
## Input
For n subjects (input n) and a specified number of simulations (input nSim), the SNP g and the unmeasured confounder u are generated from normal distributions with user specified means and variances (input gMu,gVar,uMu,uVar). phenotype 1 x and phneotype 2 y are generated such that

E\[X \] = &alpha;<sub>1</sub> +  &beta;<sub>g</sub> g +  &beta;<sub>U1</sub> U<sub>1</sub> + &epsilon;<sub>1</sub>

E\[Y \] = &alpha;<sub>2</sub> +  &beta;<sub>x</sub> x +  &beta;<sub>U2</sub> U<sub>2</sub> + &epsilon;<sub>2</sub>

where the intercepts (input alpha1 and alpha2), the genetic effect size (input betaG), the effect of the unmeasured confounder on phenotype 1 x (input betaU1), and the effect of x on y (input betaX) are specified by the user as single values. The effect of the unmeasured confounder on phneotype 2 y (input betaU2) can be a single value or a vector. The random errors &epsilon;<sub>1</sub> and &epsilon;<sub>2</sub> are generated from standard normal distributions with specified means and variances (input epsilon1Mu, epsilon1Var, epsilon2Mu, epsilon2Var). 


## Output
This function outputs the percent of simulations where the cor(g,x)<cor(g,y) and the incorrect direction is detected between X and Y using the MR Steiger approach. 

## Example:
Consider an example with 10000 subjects (input n=1e+05), the SNP g, the unmeasured confounder u, and the random errors  &epsilon;<sub>1</sub> and &epsilon;<sub>2</sub> are generated from standard normal distibutions. x and y are generated from the equations above such that the intercepts equal 0 (i.e. &alpha;<sub>1</sub>=0 and &alpha;<sub>2</sub>=0), the genetic effect size, &beta;<sub>g</sub>=1, and the effect of x on y, &beta;<sub>x</sub>=1. Consider &beta;<sub>U1</sub>= -5 and vary &beta;<sub>U1<2sub> from 0 to 11. The code to run this example is as follows.

```
library(UCMRS)
results<-UCMRS(nSim = 100, n = 1e+05, gMu = 0, gVar = 1, uMu = 0, uVar = 1, 
      alpha1 = 0, betaG = 1, betaU1 = -5, epsilon1Mu = 0, epsilon1Var = 1, 
      alpha2 = 0, betaX = 1, betaU2 = c(0,1,10,11), epsilon2Mu = 0, epsilon2Var = 1, 
      seedVal = 100, alpha = 0.05)

round(results$matrix,2)
```

The function outputs the following matrix and plot where each row corresponds to &beta;<sub>X</sub> (input betaX). As seen below, mostly case 3 is detected, which means that the MR Steiger method is inconclusive as to whether the X causes Y.
```
      case1 case2 case3   Z+ Steiger   MR corGX corGY corXY
 [1,]  0.06     0  0.94 1.00    1.00 0.06  0.58 -0.01  0.00
 [2,]  0.23     0  0.77 1.00    0.98 0.24  0.58  0.13  0.22
 [3,]  0.63     0  0.37 1.00    0.95 0.68  0.58  0.24  0.41
 [4,]  0.81     0  0.19 1.00    0.90 0.92  0.57  0.32  0.56
 [5,]  0.76     0  0.24 1.00    0.78 0.98  0.57  0.38  0.67
 [6,]  0.68     0  0.32 0.99    0.68 1.00  0.57  0.43  0.75
 [7,]  0.44     0  0.56 0.97    0.44 1.00  0.58  0.50  0.86
 [8,]  0.31     0  0.69 0.92    0.31 1.00  0.58  0.53  0.91
 [9,]  0.23     0  0.77 0.88    0.23 1.00  0.58  0.54  0.94
[10,]  0.17     0  0.83 0.86    0.17 1.00  0.58  0.55  0.96
[11,]  0.12     0  0.88 0.81    0.12 1.00  0.57  0.56  0.97
[12,]  0.12     0  0.88 0.78    0.12 1.00  0.58  0.56  0.98
```

<img src="ReverseDirection.png" width="500">

## References:
Lutz SM, Wu AC, Hokanson JE, Vansteelandt S, Lange C. (2021) Caution Against Examining the Role of Reverse Causality in Mendelian Randomization. Gen Epi.

Hemani G, Tilling K, Davey Smith G (2017) Orienting the causal relationship between imprecisely measured traits using GWAS summary data. PLOS Genetics 13(11): e1007081.

