# https://www.statology.org/bayes-theorem-in-r/

#define function for Bayes' Theorem
bayesTheorem <- function(pA_givenBr, pBr, pB1, pB2, pB3, pB4, pA_givenB1, pA_givenB2, pA_givenB3, pA_givenB4) {
  pAB <- (pA_givenBr * pBr) / (pB1*pA_givenB1 + pB2*pA_givenB2 + pB3*pA_givenB3 + pB4*pA_givenB4)
  return(pAB)
}

#define probabilities based on our case study
pNoStamp_givenJohn <- 1/200
pNoStamp_givenTom <- 1/100
pNoStamp_givenJeff <- 1/90
pNoStamp_givenPat <- 1/200
pJohn <- 0.2 
pTom <- 0.6
pJeff <- 0.15
pPat <- 0.05

#use function to calculate using Bayes' rule theorem
pJohn_givennostamp <- bayesTheorem(pJohn, pNoStamp_givenJohn, pJohn, pTom, pJeff, pPat, pNoStamp_givenJohn, pNoStamp_givenTom, pNoStamp_givenJeff, pNoStamp_givenPat)

pTom_givennostamp <- bayesTheorem(pTom, pNoStamp_givenTom, pJohn, pTom, pJeff, pPat, pNoStamp_givenJohn, pNoStamp_givenTom, pNoStamp_givenJeff, pNoStamp_givenPat)

pJeff_givennostamp <- bayesTheorem(pJeff, pNoStamp_givenJeff, pJohn, pTom, pJeff, pPat, pNoStamp_givenJohn, pNoStamp_givenTom, pNoStamp_givenJeff, pNoStamp_givenPat)

pPat_givennostamp <- bayesTheorem(pPat, pNoStamp_givenPat, pJohn, pTom, pJeff, pPat, pNoStamp_givenJohn, pNoStamp_givenTom, pNoStamp_givenJeff, pNoStamp_givenPat)

print("P(I=John | S=No Stamp) = ", pJohn_givennostamp)
print("P(I=Tom | S=No Stamp) = ", pTom_givennostamp)
print("P(I=Jeff | S=No Stamp) = ", pJeff_givennostamp)
print("P(I=Pat | S=No Stamp) = ", pPat_givennostamp)

cat(paste("P(I=John | S=No Stamp) = ", pJohn_givennostamp))
cat("\n")
cat(paste("P(I=Tom | S=No Stamp) = ", pTom_givennostamp))
cat("\n")
cat(paste("P(I=Jeff | S=No Stamp) = ", pJeff_givennostamp))
cat("\n")
cat(paste("P(I=Pat | S=No Stamp) = ", pPat_givennostamp))
cat("\n")
