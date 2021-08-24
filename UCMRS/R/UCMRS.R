UCMRS <-
function(nSim=500,n=100000,gMu=0,gVar=1,uMu=0,uVar=1,
alpha1=0,betaG=1,betaU1=-5,epsilon1Mu=0,epsilon1Var=1,
alpha2=0,betaX=1,betaU2=c(seq(0,11,by=1)),epsilon2Mu=0,epsilon2Var=1,
seedVal=100,alpha=0.05){

##################
#Store values
##################
library(psych)
set.seed(seedVal)
res<-matrix(0,ncol=5,nrow=length(betaU2))
colnames(res)<-c("betaU2","var(x)>var(y)",
"cor(g,x)<cor(g,y)","WrongDir","cwd")
res[,"betaU2"]<-betaU2

##################
#Loop
##################
for(bb in 1:length(betaU2)){
for (ss in 1:nSim){
cutS<-50
if(floor(ss/cutS)==ceiling(ss/cutS)){
	print(paste(ss,"in",nSim,"and",bb,"in",length(betaU2)))}

##################
#Generate data
##################
G<-rnorm(n,mean=gMu,sd=sqrt(gVar))
U<-rnorm(n,mean=uMu,sd=sqrt(uVar))
epsilon1<-rnorm(n,mean=epsilon1Mu,sd=sqrt(epsilon1Var))
epsilon2<-rnorm(n,mean=epsilon2Mu,sd=sqrt(epsilon2Var))

X<-alpha1+betaG*G+betaU1*U+epsilon1
Y<-alpha2+betaX*X+betaU2[bb]*U+epsilon2

##################
#Compare correlations
##################
if(abs(cor(X,G))<abs(cor(Y,G))){res[bb,"cor(g,x)<cor(g,y)"]<-res[bb,"cor(g,x)<cor(g,y)"]+1}
if(var(X)>var(Y)){res[bb,"var(x)>var(y)"]<-res[bb,"var(x)>var(y)"]+1}

##################
# MR steiger X 
##################
#xhat=BetaG_Hat*G where x=alphaG+BetaG*G+epsilonG where epsilonG~N(0,sigma^2)
xhat<-G*lm(X~G)$coef["G"]

#p-value for MR from y=betaMR*xHat+epsilonMR 
pMR<-summary(lm(Y~xhat))$coef["xhat",4]
#william test of correlation from Steiger paper
Stest<-r.test(n, r12 = abs(cor(G,X)), r13 = abs(cor(G,Y)),r23=abs(cor(X,Y)),twotailed = TRUE)
Z<-Stest$t
pSteiger<-Stest$p       
# case 1: X->Y if pSteiger<alpha and pMR<alpha and Z>0
# case 2: X<-Y if pSteiger<alpha and pMR<alpha and Z<0
# case 3: neither if pSteiger>alpha or pMR>alpha 
if(pSteiger<alpha & pMR<alpha & Z<0){
res[bb,"WrongDir"]<-res[bb,"WrongDir"]+1
if(abs(cor(X,G))<abs(cor(Y,G))){res[bb,"cwd"]<-res[bb,"cwd"]+1}
}

##################
# end loops
##################		
}#end ss
}#end bb
res[,2:ncol(res)]<-res[,2:ncol(res)]/nSim

##################
list(res)
}
