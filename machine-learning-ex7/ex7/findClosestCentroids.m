function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% we loop over all the examples x_i in X
for x_i = 1:size(X,1)
  x = X(x_i, :);

  % Find closest centroid for x_i.
  closest_centroid_dist = Inf;
  % loop over all the K centroids
  for mu_i = 1:K
    % Calculate distance to centroid mu_i
    % Set mu = coordinates of centroid mu_i
    mu = centroids(mu_i, :);
    % calculate the dot product of vector x - mu = ||x - mu||^2
    d = dot(x - mu, x - mu);
    % update the value of the idx vector for the sample x_i to the closest centroid (index)
    if d < closest_centroid_dist
      closest_centroid_dist = d;
      idx(x_i) = mu_i;
    end
  end

end




% =============================================================

end

