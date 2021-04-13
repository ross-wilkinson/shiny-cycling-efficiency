rollingResistancePower <- function(g,V_g,M_r,M_b,a,mu) {
  W <- (M_r + M_b) * -g
  P_RR <- V_g * cos(atan(a/100)) * mu * W
  print(P_RR)
}