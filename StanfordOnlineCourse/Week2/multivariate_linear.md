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

We can speed up gradient descent by having each of our input values in roughly the same range. The goal is to get all input variables into roughly one of these ranges, give or take a few. Two techniques to help us with this:

- __Feature scaling__ involves dividing the input values by the range (i.e. the maximum value minus the minimum value) of the input variable, resulting in a new range of just 1
- __Mean normalization__ involves subtracting the average value for an input variable from the values for that input variable resulting in a new average value for the input variable of just zero.

To implement both of these techniques, adjust your input values as shown in this formula:

![](http://www.sciweavers.org/tex2img.php?eq=x_i%20%3A%3D%20%5Cdfrac%7Bx_i%20-%20%5Cmu_i%7D%7Bs_i%7D&bc=White&fc=Black&im=jpg&fs=18&ff=txfonts&edit=0)

- ```s``` is range of values(max-min) or standard deviation
- ```μ``` is average of all values for feature

### Practice II - Learning Rate

__Debugging gradient descent.__ Make a plot with number of iterations on the x-axis. Now plot the cost function, J(θ) over the number of iterations of gradient descent. If J(θ) ever increases, then you probably need to decrease α.

__Automatic convergence test.__ Declare convergence if J(θ) decreases by less than E in one iteration, where E is some small value such as 10^-3. However in practice it's difficult to choose this threshold value.

> It has been proven that if learning rate α is sufficiently small, then J(θ) will decrease on every iteration.

- If α is too small: slow convergence.
- If α is too large: ￼may not decrease on every iteration and thus may not converge.

### Features and Polynomial Regression

We can improve our features and the form of our hypothesis function in a couple different ways.

We can __combine__ multiple features into one. For example, we can combine x1 and x2 into a new feature x3 by taking x1*x2.

__Polynomial Regression__:

Our hypothesis function need not be linear (a straight line) if that does not fit the data well.

We can __change the behavior or curve__ of our hypothesis function by making it a quadratic, cubic or square root function (or any other form).
