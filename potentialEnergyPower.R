potentialEnergyPower <- function(g,V_g, M_r, M_b, a){
  #INPUTS:
  # g   = value of gravity in m/s (-9.81) 
  # V_g = ground velocity in m/s
  # M_r = mass of the rider in kg
  # M_b = mass of the bike in kg
  # a   = gradient of the terrain in %
  P_PE <- V_g * (M_r + M_b) * -g * sin(atan(a/100))
  print(P_PE)
}