function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% let's start with a really high minimum error
min_error = inf;
% define the values to try
values = [0.01 0.03 0.1 0.3 1 3 10 30];


% should be a smarter way of doing this, but we'll loop through all combinations
% of values for C and sigma in values and pick the one that returns the lowest error

for C_vec = values
  for sigma_vec = values
    fprintf('training new model: C = %f, sigma = %f', C_vec, sigma_vec);
    % let's train the model for the C_vec-sigma_vec combinations using svmTrain
    model = svmTrain(X , y, C_vec, @(x1, x2) gaussianKernel(x1, x2, sigma_vec));

    % and predict using svmPredict
    predictions = svmPredict(model, Xval);
    % error in predictions
    predict_error = mean(double(predictions ~= yval));

    % check if predict_error is smaller than min_error
    if predict_error < min_error
      min_error = predict_error; % we update the min_error so that next combination of C_vec and sigma_vec will be compared to this
      C = C_vec; % updated the value of C to be returned
      sigma = sigma_vec; % updated the sigma value to be returned
      fprintf('New and better parameters found: C = %f, sigma = %f', C, sigma);
    end
  end
end
  


% =========================================================================

end
