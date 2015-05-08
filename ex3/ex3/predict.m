function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% size(Theta1) ==> 25,401   /  size(Theta1') ==> 401, 25
% size(Theta2) ==> 10, 26   /  size(Theta2') ==> 26, 10 
A1_biased = [ones(size(X, 1),1), X];  %size(A1) ==> 5000, 401

z2 = A1_biased * Theta1';

A2_non_biased = sigmoid(z2);

A2_biased = [ones(size(A2_non_biased, 1), 1), A2_non_biased]; % size(A2) is 5000, 25

z3 = A2_biased * Theta2';

A3 = sigmoid(z3); % size(A3) is 5000, 10

[max_horizontal, p] = max(A3, [], 2);


% =========================================================================


end
