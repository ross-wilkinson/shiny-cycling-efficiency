% Total cycling power

% V_w = Wind velocity (m/s)
% V_g = Ground velocity (m/s)
% p = Air density (kg/m^3)
% CdA = Drag coefficient due to frontal surface area
% D_w = Wind direction (deg)
% D_b = Bike direction (deg)
% F_w = Spoke drag factor
% g = Acceleration due to gravity (m/s^2)
% M_r = Mass of the rider (kg)
% M_b = Mass of the bike (kg)
% a = Angle of riding surface (%)
% mu = Coefficient of friction

function P_TOT = totalCyclingPower(V_w, V_g, p, CdA, D_w, D_b, F_w, g, M_r, M_b, a, mu)

P_AT = aerodynamicPower(V_w,V_g,p,CdA,D_w,D_b,F_w);

P_RR = rollingResistancePower(g, V_g, M_r, M_b, a, mu);

P_WB = wheelBearingFrictionPower(V_g);

P_PE = potentialEnergyPower(g, V_g, M_r, M_b, a);

P_NET = P_AT + P_RR + P_WB + P_PE;

E_C = 0.976;

P_TOT = P_NET / E_C;

end

function P_AT = aerodynamicPower(V_w,V_g,p,CdA,D_w,D_b,F_w)

V_wtan = V_w * cos(deg2rad(D_b-D_w));
V_a = V_g + V_wtan;
P_AT = 0.5 * p * (CdA+F_w) * V_a.^2 .* V_g;

end

function P_RR = rollingResistancePower(g, V_g, M_r, M_b, a, mu)

W = (M_r + M_b) * -g;
P_RR = V_g * cos(atan(a/100)) * mu * W;

end

function P_WB = wheelBearingFrictionPower(V_g)

P_WB = V_g .* (91 + 8.7 * V_g) / 1000;

end

function P_PE = potentialEnergyPower(g, V_g, M_r, M_b, a)

P_PE = V_g * (M_r + M_b) * -g * sin(atan(a/100));

end
