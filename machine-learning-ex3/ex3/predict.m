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

% adding bias column x0 infront of X (size is m x n)
X = [ones(m,1), X]; % now X is m x n+1

%activation function for second layer
% size of theta1 is no. of nd layer units x n+1

a2 = sigmoid(X * Theta1'); % size = m x no: of second layer units

% adding bias layer infront of activation function
a2 = [ones(m,1), a2]; % now size is m x (2nd units+1)

% calculating activation for third layer
a3 = sigmoid (a2 * Theta2'); % ( m x 2nd+1 ) X (2nd+1 X num_labels)
% a3 resultant size = m x num_labels

[val, p] = max(a3, [] ,2); % max row wise and assigns the index to p
% size of p = m x 1

% =========================================================================


end
