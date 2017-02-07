function g = sigmoid(z)
  %SIGMOID Compute sigmoid function
  %   g = SIGMOID(z) computes the sigmoid of z.

  g = zeros(size(z));
  g = 1 ./ (1 + e.^(-z));

end
