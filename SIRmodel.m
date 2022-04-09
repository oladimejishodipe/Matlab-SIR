%SI_Model
%This Model for the spread of a disease is
% only dependent on the state variable  S, I & R
% Oladimeji Shodipe 09-19-2020

%% Set Parameter
I0 =1e-4; % Initial number of infected 
           % (now we work with proportio) 
a=0.8; % Infection Coefficiet in wk^-1
b=0.2; % Removal Coefficient in weeek-1

tmax=150; % NUmber of Weeks 
dt=.9; % Size of time steps in week ( Since want to get dI
        % we would cross multiply to other side
Imax = 1.1; % Max number infected for graph

%plotchoice = 4; % 1=S, 2=I, 3=R 4= All
%% Initialise Vectors
t=0:dt:tmax; % time vector
Nt = length (t); % number of time steps
I = zeros(1, Nt);  % infection vector
S = zeros(1, Nt);  % Susceptible vector
R = zeros(1, Nt);  % Removed vector
TI= zeros(1, Nt);
I(1)= I0;   % set initial infectio value
%% Calculations 
for it =1:Nt-1
    TI(it+1)=TI(it) +1; 
    S(it)=1-I(it)-R(it);
 dI=a*I(it)*S(it) - b*I(it); % rate of change per week;
 I(it+1)=I(it) + dI*dt;
 dR=b*I(it);
 R(it +1) =R(it) + dR*dt;
 
 
  scatter(TI(it),I(it), 'r', 'o');hold on
  scatter(TI(it),S(it), 'm', 'o'); hold on
 scatter(TI(it),R(it), 'b', 'o'); 
        axis([0 tmax 0 Imax])
        grid on
        grid minor
        xlabel ('Time (week)')
        ylabel ('Proportion of S,I and R')
        title ('Proportion of S,I and R vs Time')  
        pause(0.01)

end;
S(Nt)=1-I(Nt)- R(Nt);
min(S)  % Last propotion of susceptible 
max(I)  % Last propotion of Infectious  
%{
    % Plots
switch plotchoice
    case 1
     plot(t,S, '-b', 'LineWidth', 3)
        axis([0 tmax 0 Imax])
        grid on
        grid minor
        xlabel ('Time (week)')
        ylabel ('Proportion of Susceptible')
        title ('Proportion of Susceptible vs Time')   
        pause(0.1)
        
         %{
   plot for animation
   scatter(U(i), V(i), 'm', 'filled');
   hold on
   scatter(W(i), V(i), 'r', 'filled');
   hold on
   scatter(W(i), U(i), 'b', 'filled');
   hold on
   pause(0.1)
   
   %}
  
    case 2
        plot(t,I, '-r', 'LineWidth', 3)
        axis([0 tmax 0 Imax])
        grid on
        grid minor
        xlabel ('Time (week)')
        ylabel ('Proportion of Infected')
        title ('Proportion of Infections vs Time')
     case 3
        plot(t,R, '-g', 'LineWidth', 3)
        axis([0 tmax 0 Imax])
        grid on
        grid minor
        xlabel ('Time (week)')
        ylabel ('Proportion of Removed')
        title ('Proportion of Removed vs Time')
    case 4
      plot(t,I, '-r', ...
          t, S, '-b', ... 
          t, R, '-m' , 'LineWidth', 3)
        axis([0 tmax 0 Imax])
        grid on
        grid minor
        xlabel ('Time (week)')
        ylabel ('Proportion of S,I and R')
        title ('Proportion of S,I and R vs Time')  
end
%}