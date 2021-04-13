aerodynamicPower <- function(V_w,V_g,p,CdA,D_w,D_b,F_w){
  V_wtan <- V_w * cos((D_b-D_w) / (180/pi))
  V_a <- V_g + V_wtan
  P_AT <- 0.5 * p * (CdA+F_w) * V_a^2 * V_g
  print(P_AT)
}