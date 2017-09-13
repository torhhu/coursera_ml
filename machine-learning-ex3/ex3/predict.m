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


% first calculate the values for the hidden layer, then use those as input to
% the output layer

% define a1 as X'
a1 = X'; %this is a 400 x m matrix in our example
% add ones to a1
a1 = [ones(1, size(a1, 2)); a1];

%calculate a2 as sigmoid(Theta1 * a1)

a2 = sigmoid(Theta1 * a1); % this should return a 25 x m+1 matrix

% add ones to a2
a2 = [ones(1, size(a2, 2)); a2];

% a3 is the output layer
a3 = sigmoid(Theta2 * a2);

% we find and return the indices for the predictions as in the previous example
[nn_max_val, nn_max_ix] = max(a3);

p = nn_max_ix';

% =========================================================================


end
