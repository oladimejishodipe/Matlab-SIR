%I_Model
%This Model for the spread of a disease is only
%dependent on the state variable I

%% Set Parameter
Io =10; % Initial number of infected 
a= 0.8; % Coefficiet in wk^-1

tmax=10; % NUmber of Weeks 
dt=.01; % Size of time steps in week ( Since want to get dI
        % we would cross multiply to other side
Imax = 2e4; % Max number infected for graph
%% Initialise Vectors
t=0:dt:tmax; % time vector
Nt = length (t); % number of time steps
I= zeros(1, Nt)  % infection vector
I(1)= Io;   % set initial infectio value
%% Calculations 
for it =1:Nt-1
 dI=a*I(it); % rate of change per week;
 I(it+1)=I(it) + dI*dt;
end 
%% Plots
plot(t,I, '-r', 'LineWidth', 3)
axis([0 tmax 0 Imax])
grid on
grid minor
xlabel ('Time (week)')
ylabel ('Number Infected')
title ('Number of Infections vs Time')