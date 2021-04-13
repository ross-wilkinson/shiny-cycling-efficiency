% Metabolic efficiency to cycling performance

% Calculate change in mechanical power
MetP = 0:2000;
GE = (0.25:0.0025:0.275)';
MechP = GE * MetP;

% set variables
V_g = 0:0.01:20; %env
V_w = 0; % env
p = 1.2234; %env
CdA = 0.2565; %rider
D_w = 310; %env
D_b = 340; %env
F_w = 0.0044; %eq
g = -9.81; %env
M_r = 80; % Rider
M_b = 10; % Equipment
a = 0; % Environment
mu = 0.0032; %eq


P_TOT = totalCyclingPower(V_w, V_g, p, CdA, D_w, D_b, F_w, g, M_r, M_b, a, mu);

% Plot
figure('color','w')
GE = [0.22 0.23];
ltypes = {'-','--',':','-.'};

for i = 1:length(GE)
    plot(P_TOT/GE(i),P_TOT,'k','linestyle',ltypes{i}); 
    hold on; 
end
xlabel('Metabolic Power (W)')
ylabel('Mechanical Power (W)')
box off

yyaxis right
ax = gca;
ax.YAxis(2).Color = 'r';

for i = 1:length(GE)
    plot(P_TOT/GE(i),V_g,'r','linestyle',ltypes{i}); 
    hold on; 
end

ylabel('Velocity (m/s)')

xlim([0 2500])
ylim([0 16])

legend({'Rider 1','Rider 2'})
leg = legend;
leg.Location = 'best';
leg.Title.String = 'Gross efficiency';
leg.Box = 'off';

