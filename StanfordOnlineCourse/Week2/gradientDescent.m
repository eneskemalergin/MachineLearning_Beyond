function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters)
%   updates theta by taking num_iters gradient steps with learning rate alpha

  % number of training examples
  m = length(y);
  J_history = zeros(num_iters, 1);

  for iter = 1:num_iters


      theta = theta - alpha * (1/m) * sum((X*theta-y).*X)'

      % Save the cost J in every iteration
      J_history(iter) = computeCost(X, y, theta);

  end;
    disp(min(J_history));
end;
