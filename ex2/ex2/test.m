clear ; close all; clc

data = load('ex2data1.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);


theta = zeros(2, 1);

J = costFunction(theta, X, y )