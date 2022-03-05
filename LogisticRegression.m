%% Initialize
clear; close all;

%% Load the data
load('dataset4.mat');

%% Plot the data

PlotData(X,Y);


%% Compute Cost and Gradient

[m,n] = size(X);
InitialTheta = zeros((n+1), 1);

[R,grad] = computeCost(InitialTheta,X,Y);

fprintf('The Risk Calculated with initial Theta is: %d', R);

%% Compute Gradient Descent Algorithm
fileID = fopen('risk.txt','w');



Eta = 0.1;
E = 0.0001;  %% Tolerance
iteration = 1;
Theta_old = InitialTheta';
Theta_new = Theta_old - Eta*grad;
Remp_list = [];
while(norm(Theta_new - Theta_old) >= E)
     [R,grad] = computeCost(Theta_new',X,Y);
     
     fprintf(fileID,'The Risk Calculated after every iteration %i is %d : %s\n', iteration, R,'risk.txt');
     Theta_old = Theta_new;
     Theta_new = Theta_new - Eta*grad;
     iteration = iteration + 1;
end
fclose(fileID);

g=sprintf('%d ', Theta_new);
fprintf('\nThe Value of optimal Theta found is: %s\n', g)
fprintf('\nNumber of Iterations required to arrive at this optimal Theta is : %i \n', iteration);
fprintf('\nThe Risk Calculated with optimal Theta is: %d\n\n', R);

%% assume two variables and search for the third one based on these assumed variables that fit the polynomial 

[x1, x2]= meshgrid(-1:0.01:1, -1:0.01:1);

x3 = (-1/Theta_new(4)) * (Theta_new(2)*x1 +Theta_new(3)*x2 +Theta_new(1));
surf(x1,x2,x3);
xlabel("X1");
ylabel("X2");
zlabel("X3");
title("Binary Classification of the dataset");





