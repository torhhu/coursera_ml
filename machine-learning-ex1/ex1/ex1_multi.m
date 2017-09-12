%% Machine Learning Online Class
%  Exercise 1: Linear regression with multiple variables
%
%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  linear regression exercise. 
%
%  You will need to complete the following functions in this 
%  exericse:
%
%     warmUpExercise.m
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%     gradientDescentMulti.m
%     computeCostMulti.m
%     featureNormalize.m
%     normalEqn.m
%
%  For this part of the exercise, you will need to change some
%  parts of the code below for various experiments (e.g., changing
%  learning rates).
%

%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];


%% ================ Part 2: Gradient Descent ================

% ====================== YOUR CODE HERE ======================
% Instructions: We have provided you with the following starter
%               code that runs gradient descent with a particular
%               learning rate (alpha). 
%
%               Your task is to first make sure that your functions - 
%               computeCost and gradientDescent already work with 
%               this starter code and support multiple variables.
%
%               After that, try running gradient descent with 
%               different values of alpha and see which one gives
%               you the best result.
%
%               Finally, you should complete the code at the end
%               to predict the price of a 1650 sq-ft, 3 br house.
%
% Hint: By using the 'hold on' command, you can plot multiple
%       graphs on the same figure.
%
% Hint: At prediction, make sure you do the same feature normalization.
%

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.01;
num_iters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(3, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Find a good learning rate alpha
a1 = 0.01;
a2 = 0.03;
a3 = 0.1;
a4 = 0.3;
a5 = 1.0;
num_iters = 50;

t1 = zeros(3, 1);
t2 = zeros(3, 1);
t3 = zeros(3, 1);
t4 = zeros(3, 1);
t5 = zeros(3, 1);

% run gradien descent for the different learning rates
[t1, J1] = gradientDescentMulti(X, y, t1, a1, num_iters);
[t2, J2] = gradientDescentMulti(X, y, t2, a2, num_iters);
[t3, J3] = gradientDescentMulti(X, y, t3, a3, num_iters);
[t4, J4] = gradientDescentMulti(X, y, t4, a4, num_iters);
[t5, J5] = gradientDescentMulti(X, y, t5, a5, num_iters);

% plot the thetas
% Plot the convergence graph
figure;
hold on;
plot(1:numel(J1), J1, '-b', 'LineWidth', 2);
plot(1:numel(J2), J2, '-r', 'LineWidth', 2);
plot(1:numel(J3), J3, '-k', 'LineWidth', 2);
plot(1:numel(J4), J4, '-g', 'LineWidth', 2);
plot(1:numel(J5), J5, '-y', 'LineWidth', 2);
legend('alpha 0.01', 'alpha 0.03', 'alpha 0.1', 'alpha 0.3', 'alpha 1.0');
xlabel('Number of iterations');
ylabel('Cost J');
hold off;

% it seems a learning rate of 1 could be used
% Init Theta and Run Gradient Descent 
theta = zeros(3, 1);
alpha = a5;
num_iters = 100;
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);


% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
% Recall that the first column of X is all-ones. Thus, it does
% not need to be normalized.
H = [1650, 3];
H_norm = (H - mu) ./ sigma;
% Add intercept term to house_norm
H_norm = [ones(1, 1) H_norm];


price = H_norm *theta; % You should change this


% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent):\n $%f\n'], price);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 3: Normal Equations ================

fprintf('Solving with normal equations...\n');

% ====================== YOUR CODE HERE ======================
% Instructions: The following code computes the closed form 
%               solution for linear regression using the normal
%               equations. You should complete the code in 
%               normalEqn.m
%
%               After doing so, you should complete this code 
%               to predict the price of a 1650 sq-ft, 3 br house.
%


%% Load Data
data = csvread('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');


% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
price = [1, 1650, 3] * theta; % You should change this


% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations):\n $%f\n'], price);

