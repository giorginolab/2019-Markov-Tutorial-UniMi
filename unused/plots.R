library(expm)

P <- matrix(c(.9,.1,.5,.5),2,2,byrow=T)

s0 <- c(1,0)

N<-6
s <- matrix(0,N,2)

for (i in 1:N) {
    s[i,] <- s0 %*% (P %^% (i-1) )
}

matplot(s,type="o", xlab="Time (day)", ylab="State probabilities")



# -----

P <- matrix(c(.6,.3,.1,
              .2,.3,.5,
              .4,.1,.5),3,3,byrow=T)

s0 <- c(1,0,0)
N<-6
s <- matrix(0,N,3)
for (i in 1:N) {
    s[i,] <- s0 %*% (P %^% (i-1) )
}

matplot(s,type="o", xlab="Time (day)", 
        ylab="State probabilities",
        main="Initial state: s0 = [1,0,0]")



s0 <- c(0,1,0)
N<-6
s <- matrix(0,N,3)
for (i in 1:N) {
    s[i,] <- s0 %*% (P %^% (i-1) )
}

matplot(s,type="o", xlab="Time (day)", 
        ylab="State probabilities",
        main="Initial state: s0 = [0,1,0]")


# ------

ei<-eigen(t(P))
s_inf <- ei$vectors[,1] / sum(ei$vectors[,1])
abline(h=s_inf,col=1:3)



