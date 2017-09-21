% Calculate the partial derivative of the cost function J: d/dtheta_i J(theta)
% dim of parameter matrix theta, often unrolled in to vector
for i = 1:n;
  thetaPlus = theta;
  thetaPlus(i) = thetaPlus(i) + EPSILON;
  thetaMinus = theta;
  thetaMinus(i) = thetaMinus(i) - EPSILON;
  gradApprox(i) = (J(thetaPlus) - J(thetaMinus)) / (2*EPSILON); % check that gradApprox ~ DVec
 end;
 
 
 % alternative
epsilon = 1e-4;
for i = 1:n,
  thetaPlus = theta;
  thetaPlus(i) += epsilon;
  thetaMinus = theta;
  thetaMinus(i) -= epsilon;
  gradApprox(i) = (J(thetaPlus) - J(thetaMinus))/(2*epsilon)
end;

% randomize
Theta1 = rand(10,11) * (2 * INIT_EPSILON) - INIT_EPSILON;

Theta2 = rand(1,11) * (2 * INIT_EPSILON) - INIT_EPSILON;