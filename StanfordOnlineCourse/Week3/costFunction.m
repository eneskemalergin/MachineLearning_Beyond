function [J, grad] = costFunction(theta, X, y)
  %COSTFUNCTION Compute cost and gradient for logistic regression
  %   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
  %   parameter for logistic regression and the gradient of the cost
  %   w.r.t. to the parameters.

  % Initialize some useful values
  m = length(y); % number of training examples

  J = 0;
  grad = zeros(size(theta));

  % Calculating J
  H = sigmoid(X*theta);
  T = y.*log(H) + (1 - y).*log(1 - H);
  J = -1/m*sum(T);

  % Compute grad
  for i = 1 : m,
	   grad = grad + (H(i) - y(i)) * X(i,:)';
  end

  grad = 1/m*grad;

end
