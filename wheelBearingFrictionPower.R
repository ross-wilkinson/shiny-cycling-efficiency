wheelBearingFrictionPower <- function(V_g){
  P_WB <- V_g * (91 + 8.7 * V_g) / 1000
  print(P_WB)
}