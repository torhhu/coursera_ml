function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).


% the sigmoid is defined as g(z) = 1/(1+e^-z)
% thus works only for scalar
%exponential = exp(-z);
%g = 1 / (1+exponential);

% implementation that works for matrices, vectors, or scalars 

g = 1.0 ./ (1.0 + e.^(-z)); % dot(.) with division and power operations


% =============================================================

end
