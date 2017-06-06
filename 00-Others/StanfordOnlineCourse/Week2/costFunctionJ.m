function J = costFunctionJ(X,y, theta)
    % X is the "Design matrix" containing our training examples
    % y is the class labels
    
    m = size(X,1); % number of training examples
    predictions = X * theta; % predictions of hypothesis on all m examples
    sqrErrors = (predictions-y).^2; % Squared Errors
    
    J = 1/(2*m) * sum(sqrErrors);