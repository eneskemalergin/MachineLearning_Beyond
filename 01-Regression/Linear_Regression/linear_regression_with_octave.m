% Load the data from our text file
data = load('./data.txt');

% Define x and y
x = data(:,2);
y = data(:,1);

% Create a function to plot the data
function plotData(x,y)
  plot(x,y,'rx','MarkerSize',8); % Plot the data
end

% Plot the data
plotData(x,y);
xlabel('Rate of Cricket Chirping'); % Set the x-axis label
ylabel('Temperature in Degrees Fahrenheit'); % Set the y-axis label
fprintf('Program paused. Press enter to continue.\n');
pause;

% Count how many data points we have
m = length(x);
% Add a column of all ones (intercept term) to x
X = [ones(m, 1) x];

% Calculate theta using Normal Equation
theta = (pinv(X'*X))*X'*y

% Plot the fitted equation we got from the regression
hold on; % this keeps our previous plot of the training data visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % Don't put any more plots on this figure
