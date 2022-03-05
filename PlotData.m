function PlotData(X,Y)
%% This is to plot the 3 variables in X dataset in a 3D plot
ones = find(Y == 1);
zeroes = find(Y == 0);

x1 = X(ones,1);
x2 = X(ones,2);
x3 = X(ones,3);

x4 = X(zeroes,1);
x5 = X(zeroes,2);
x6 = X(zeroes,3);


%For values of x1, x2, x3 where the y value is one will have a red cross
% on the plot
plot3(x1, x2, x3,'rx');
hold on;

%For values of x1, x2, x3 where the y value is one will have a blue circle
% on the plot
plot3(x4, x5, x6, 'bo');
xlabel("X1");
ylabel("X2");
zlabel("X3");
title("Binary Classification of the dataset");

end

