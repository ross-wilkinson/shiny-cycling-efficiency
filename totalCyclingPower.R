totalCyclingPower <- function(V_w, V_g, p, CdA, D_w, D_b, F_w, g, M_r, M_b, a, mu){

P_AT <- aerodynamicPower(V_w, V_g, p, CdA, D_w, D_b, F_w)

P_RR <- rollingResistancePower(g, V_g, M_r, M_b, a, mu)

P_WB <- wheelBearingFrictionPower(V_g)

P_PE <- potentialEnergyPower(g, V_g, M_r, M_b, a)

P_NET <- P_AT + P_RR + P_WB + P_PE

E_C <- 0.976

P_TOT <- P_NET / E_C

}