function [R, grad] = computeCost(Theta,X,Y)
%% Calculating Sigmoid
m = size(X,1);
X = [ones(m,1) X];          %To add a bias column at the beginning
h = sigmoid(X*Theta);

%% Calculate the Empirical logistic loss and gradient factor

R = (1/m) * sum((Y -1).*log(1-h) - Y.*log(h));

grad = (h-Y)'*X;

