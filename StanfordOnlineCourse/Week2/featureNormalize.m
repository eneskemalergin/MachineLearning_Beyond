function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

  % You need to set these values correctly
  X_norm = X;
  mu = zeros(1, size(X, 2));
  sigma = zeros(1, size(X, 2));

  % Get the mean of X
  mu = mean(X)
  % Get the Standard Deviation
  sigma = std(X)

  % Iterate over the X
  for iter = 1:size(X, 2)
    % For each Xi update value in X_norm 
    X_norm(:,iter) = (X(:,iter) - mu(iter)) / sigma(iter);
  end;

end;
