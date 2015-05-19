function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% theta => [2,1]
% X => [m,2]
% y => [m,1]


J = 1 / (2*m) * ( X*theta - y)' * ( X*theta - y);

% theta => [2,1]
thetaFiltered = theta(2:end,:);

reg_cost = lambda / (2*m) * thetaFiltered' * thetaFiltered;

J = J + reg_cost;

% grad => [2,1]
grad = 1/ (m)* (X'*(X*theta - y)); % [m,2]*[2,1] - [m,1] => [m,1] * [m,2]
reg_grad = lambda / m * thetaFiltered; 
grad(2:end,1) = grad(2:end,1) + reg_grad;


% =========================================================================

grad = grad(:);

end
