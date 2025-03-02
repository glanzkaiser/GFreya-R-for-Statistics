# https://www.statology.org/bayes-theorem-in-r/

#define function for Bayes' Theorem
bayesTheorem <- function(pA_givenBr, pBr, pB1, pB2, pB3, pA_givenB1, pA_givenB2, pA_givenB3) {
  pAB <- (pA_givenBr * pBr) / (pB1*pA_givenB1 + pB2*pA_givenB2 + pB3*pA_givenB3)
  return(pAB)
}

#define probabilities based on our case study
pDefect_givenP1 <- 0.01
pDefect_givenP2 <- 0.03
pDefect_givenP3 <- 0.02
pPlan1 <- 0.3 
pPlan2 <- 0.2
pPlan3 <- 0.5

#use function to calculate using Bayes' rule theorem
pP1_givendefect <- bayesTheorem(pDefect_givenP1, pPlan1, pPlan1, pPlan2, pPlan3, pDefect_givenP1, pDefect_givenP2, pDefect_givenP3)

pP2_givendefect <- bayesTheorem(pDefect_givenP2, pPlan2, pPlan1, pPlan2, pPlan3, pDefect_givenP1, pDefect_givenP2, pDefect_givenP3)

pP3_givendefect <- bayesTheorem(pDefect_givenP3, pPlan3, pPlan1, pPlan2, pPlan3, pDefect_givenP1, pDefect_givenP2, pDefect_givenP3)

cat(paste("P(P1 | D) = ", pP1_givendefect))
cat("\n")
cat(paste("P(P2 | D) = ", pP2_givendefect))
cat("\n")
cat(paste("P(P3 | D) = ", pP3_givendefect))
cat("\n")