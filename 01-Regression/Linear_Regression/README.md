# Linear Regression

## Content
- [The Concept](#concept)
- [The Math](#math)
- [The Data](#data)
- [Implementations](#implementations)
- [Sources](#sources)

## Concept

Linear Regression developed in field of statistics, but unlike all machine learning that basically is built on top of math and statistics, Linear Regression is studied and used as a model for understanding the relationship between input and output numerical variables. For that matter we say that it's both machine learning algorithm and statistical algorithm.

- Linear regression is a linear model, where we can calculate output variable(y) from linear combination of input variables(x).
- Simple Linear Regression is linear regression with single input variable
- Multiple Linear Regression is when linear regression have multiple input variables.

We represent the linear regression with a linear equation that combines a specific set of input values the solution to which is the predicted output for that set of input values, where both values are numeric.

  x = y

Then linear equation assigns one scale factor to each input value called a coefficient with an additional coefficient giving the line an additional degree of freedom (usually called intercept or the bias coefficient).

  B0 + (B1 * x) = y

This very basic representation is for simple linear regression. So now we have an understanding of the mathematical representation but where is the learning in this. Learning in a linear regression means estimating the values of the coefficients used in the representation with the data.

There are a lot of techniques to calculate the error and calculate the most optimum values for coefficients, let's talk about some of them.

**Simple Linear Regression**

- When having a single input, we use statistics (mean, standard deviation, correlation, covariance) to estimate the coefficients.

**Ordinary Least Squares(OLS)**

- [Here is a nice interactive visual explanation of Ordinary Least Squares Regression](http://setosa.io/ev/ordinary-least-squares-regression/)
- One of the most common method to use when having multiple input.
- OLS seeks to minimize the sum of the squared residuals.
  - Calculate the distance from each data point to the regression line
  - Square them
  - Sum all
  - The value is the error, and OLS seeks to minimize it.
- This method is highly vectorized and performs matrix operations, hence very fast.

**Gradient Descent**

Starts with random values for each coefficient. The sum of the squared errors are calculated for each pair of input and output values. A learning rate is used as a scale factor and the coefficients are updated in the direction towards minimizing the error. The process is repeated until a minimum sum squared error is achieved or no further improvement is possible.

Learning rate (alpha) parameter should be selected for this, which is the size of the improvement step to take on each iteration of the procedure.

It's useful when having a very very large dataset either in the number of rows or the number of columns that may not fit into memory.

**Regularization**

- These are extensions of the linear model training.
- Purpose of these extensions:
  - Minimize the sum of the squared error of the model on the training data
  - To reduce the complexity of the model
- *Lasso Regression*: where Ordinary Least Squares is modified to also minimize the absolute sum of the coefficients (called L1 regularization).
- *Ridge Regression*: where Ordinary Least Squares is modified to also minimize the squared absolute sum of the coefficients (called L2 regularization).
- These are effective when there is a chance to overfit, and collinearity input.

## Math

> Coming Soon.

## Data

Here are some tips on how to prepare a data for the linear regression model.

- **Linear Assumption**: Make sure to transform the data to make the relationship linear. (for instance, log transform for an exponential relationship)
- **Remove Noise**: Outliers should be removed and make sure input and output variables are not noisy.
- **Remove Collinearity**: model will overfit if there are highly correlated input variables. Calculating pairwise correlations for input data and removing most correlated would help.
- **Gaussian Distributions**: More reliable prediction if input and ouput variables have a Gaussian distribution. You may get some benefit using transforms (e.g. log or BoxCox) on you variables to make their distribution more Gaussian looking.
- **Rescale Inputs**: More reliable predictions if you rescale input variables usign standardization or normalization.

## Implementations

- [Octave](linear_regression_with_octave.m)


> Can add more like Java, C++, Julia, Torch/Lua


## Sources

1. [Machine Learning Mastery - Linear Regression for Machine Learning](https://machinelearningmastery.com/linear-regression-for-machine-learning/)
2. [Wikipedia - Linear Regression](https://en.wikipedia.org/wiki/Linear_regression)
3. [Towards Data Science - Linear Models Part 1](https://towardsdatascience.com/machine-learning-linear-models-part-1-312757aab7bc)
4.
