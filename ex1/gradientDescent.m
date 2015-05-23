function [theta, J_history, T_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
T_history = zeros(num_iters, 2);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %


    theta = theta - alpha / m * ((X * theta - y)' * X)';

    %for i = 1:size(theta,1)
    %  grad(i,1) = sum((X * theta - y ) .*X(:,i)) ./ m;
    %end
    %theta = theta - alpha * grad;


    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
    theta_inv = theta';

    T_history(iter,1) = theta_inv(1);
    T_history(iter,2) = theta_inv(2);

    if rem(iter,50) == 1 && alpha == 0.01
        hold on; % keep previous plot visible
        plot(X(:,2), X*theta, '-')
        fprintf('Program paused. Press enter to continue. Iteration number %f \n', iter);
        pause;
    end



    
     

end

end
