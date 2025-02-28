clc; clear all; close all;

%% Scenario 1: Stable Oscillations 
% This scenario models a system where populations of plants, hares, and lynx
% oscillate in a stable manner, with a periodicity of around 70 months.

% Time span for simulation
tspan = [0 1000];

% Initial population values for plants, hares, and lynx
y0 = [2; 0.2; 8];

% Model parameters for stable oscillations
a1 = 5;  % Growth rate of plants
b1 = 3;  % Consumption rate of hares on plants
a2 = 0.1;  % Predation rate of lynx on hares
b2 = 1;  % Efficiency of predation
d1 = 0.4;  % Natural death rate of hares
d2 = 0.01; % Natural death rate of lynx

% Solving the system of differential equations
[t, y] = ode45(@(t,y) three_species_model(t, y, a1, b1, a2, b2, d1, d2), tspan, y0);

% Plot population dynamics over time
figure;
subplot(2,1,1);
plot(t, y);
legend('Plants', 'Hares', 'Lynx');
title('Scenario 1: Stable Oscillations');
xlabel('Time (months)'); ylabel('Population');

% 3D State Space Plot
subplot(2,1,2);
plot3(y(:,1), y(:,2), y(:,3));
xlabel('Plants'); ylabel('Hares'); zlabel('Lynx');
title('State Space - Stable Oscillations');
grid on;

%% Scenario 2: Lynx Extinction
% This scenario models a situation where the lynx population goes extinct due to a higher death rate.
% The plant and hare populations stabilize over time.

% Define the time span for simulation
tspan = [0 200]; 

% Initial population values for plants, hares, and lynx
y0 = [0.9; 0.1; 8];

% Define model parameters for stable oscillations
a1 = 3.7;  % Growth rate of plants
b1 = 4;  % Consumption rate of hares on plants
a2 = 0.01;  % Predation rate of lynx on hares
b2 = 0.1;  % Efficiency of predation
d1 = 0.6;  % Natural death rate of hares
d2 = 0.4; % Natural death rate of lynx

% Solving the system
[t, y] = ode45(@(t,y) three_species_model(t, y, a1, b1, a2, b2, d1, d2), tspan, y0);

% Plot results
figure;
subplot(2,1,1);
plot(t, y);
legend('Plants', 'Hares', 'Lynx');
title('Scenario 2: Lynx Extinction');
xlabel('Time (months)'); ylabel('Population');

subplot(2,1,2);
plot3(y(:,1), y(:,2), y(:,3));
xlabel('Plants'); ylabel('Hares'); zlabel('Lynx');
title('State Space - Lynx Extinction');
grid on;

%% Scenario 3: Chaotic Behavior
% This scenario models a chaotic system where small changes in initial conditions
% lead to unpredictable, irregular fluctuations over time.

% Time span for simulation
tspan = [0 1000];

% Initial population values for plants, hares, and lynx
y0 = [2; 0.2; 8];

% Proving Sensitivity to initial conditions
y0S = [2; 0.4; 8];

% Model parameters for stable oscillations
a1 = 5;  % Growth rate of plants
b1 = 3;  % Consumption rate of hares on plants
a2 = 0.1;  % Predation rate of lynx on hares
b2 = 2;  % Efficiency of predation
d1 = 0.4;  % Natural death rate of hares
d2 = 0.01; % Natural death rate of lynx

% Solving the system of differential equations
[t, y] = ode45(@(t,y) three_species_model(t, y, a1, b1, a2, b2, d1, d2), tspan, y0);

[tS, yS] = ode45(@(t,y) three_species_model(t, y, a1, b1, a2, b2, d1, d2), tspan, y0S);

% Plot population dynamics over time
figure;
subplot(2,1,1);
plot(t, y);
legend('Plants', 'Hares', 'Lynx');
title('Scenario 1: Stable Oscillations');
xlabel('Time (months)'); ylabel('Population');

% 3D State Space Plot
subplot(2,1,2);
plot3(y(:,1), y(:,2), y(:,3));
xlabel('Plants'); ylabel('Hares'); zlabel('Lynx');
title('State Space - Stable Oscillations');
grid on;

% Sensitivity check for different initial value conditions
figure;
plot(t, y, tS, yS, '--');
legend('Plants_y', 'Hares_y', 'Lynx_y', 'Plants_yS', 'Hares_yS', 'Lynx_yS');
title('Sensitivity To Initial Conditions');
xlabel('Time (months)'); ylabel('Population');


% Proving deterministic behavior
figure;

for n = 1:3
    X_N = y([1:end-1],n); %The values of population 'n' from t1 until tend-1
    X_Nplus1 = y([2:end],n); %The values of population 'n' from t2 until tend
    scatter(X_N, X_Nplus1); %Plotting t1 vs t2, t2 vs t3, ..., tend-1 vs tend
    xlabel('X_N');
    ylabel('X_{N+1}');
    grid on; hold on;
    title('Graph of the function X_{N+1} = rX_N(1 - X_N) for r = 4');
end 

% The plot shows three different, clearly defined clusters of points, representing deterministic behavior for all three populations.

%% Function defining the three-species model
% This function computes the rate of change for each population over time.
function dydt = three_species_model(~, y, a1, b1, a2, b2, d1, d2)
    dydt = zeros(3,1);
    dydt(1) = y(1)*(1-y(1)) - ((a1*y(1))/(1+b1*y(1)))*y(2);  % Plant dynamics
    dydt(2) = ((a1*y(1))/(1+b1*y(1)))*y(2) - d1*y(2) - (a2*y(2)/(1+b2*y(2)))*y(3);  % Hare dynamics
    dydt(3) = (a2*y(2)/(1+b2*y(2)))*y(3) - d2*y(3);  % Lynx dynamics
end
