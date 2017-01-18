## Multivariate Linear Regression

### Multiple Features

Linear regression with multiple variables is also known as "multivariate linear regression".


The multivariable form of the hypothesis function accommodating these multiple features is as follows:

![Multivariate Hypothesis](http://bit.ly/2jZUfkb)

In order to develop intuition about this function, we can think about θ0 as the basic price of a house, θ1 as the price per square meter, θ2 as the price per floor, etc. x1 will be the number of square meters in the house, x2 the number of floors, etc.


Using the definition of matrix multiplication, our multivariable hypothesis function can be concisely represented as:

![](http://bit.ly/2k012dX)

This is a vectorization of our hypothesis function for one training example; see the lessons on vectorization to learn more.

### Gradient Descent for Multiple Variables

The gradient descent equation itself is generally the same form; we just have to repeat it for our 'n' features:

repeat until convergence: {

  ![](http://bit.ly/2k09oSu)

}

### Practice I - Feature Scaling
