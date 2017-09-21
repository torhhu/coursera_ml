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


predictions = X*theta;	% calculate the predicted values from our hypothesis on all m examples
sqrErrors = (predictions-y) .^2; % squared errors, element wise


% add regularization
% let's create a new regularization theta with 0 for the first element
theta_reg = [0; theta(2:size(theta))];

J = 1/(2*m) * sum(sqrErrors) + (lambda/(2*m))* theta_reg' * theta_reg; % adding regularization term, will be 0 for the theta_0

grad = (1/m) * (X' * (predictions - y)+ lambda*theta_reg);




% =========================================================================

grad = grad(:);

end
