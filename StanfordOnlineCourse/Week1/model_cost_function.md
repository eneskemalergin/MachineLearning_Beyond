## Linear Regression with One Variable

### Model Representation

Predicting Housing Prices requires us to use supervised learning more specifically a regression model because;
- we are given the "right answers" for each example data,
- we want to predict real valued output.  

__Establishing the notation for future usage:__

- x^(i) to denote the input variables/features
- y^(i) to denote the output variables


To describe the supervised learning problem slightly more formally, our goal is, given a training set, to learn a function ```h : X → Y``` so that ```h(x)``` is a “good” predictor for the corresponding value of y. For historical reasons, this function h is called a hypothesis. Seen pictorially, the process is therefore like this:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/H6qTdZmYEeaagxL7xdFKxA_2f0f671110e8f7446bb2b5b2f75a8874_Screenshot-2016-10-23-20.14.58.png?expiry=1484784000000&hmac=6FJ8rByxGWZrlVRkAfzzrA6w7uL4FpZykdvRyatIAyA)

When the target variable that we’re trying to predict is continuous, such as in our housing example, we call the learning problem a __regression problem__.



### Cost Function

__How to fit the best possible line?__

We can measure the accuracy of our hypothesis function by using a cost function.

This takes an average difference (actually a fancier version of an average) of all the results of the hypothesis with inputs from ```x```'s and the actual output ```y```'s.

![Cost Function](http://bit.ly/2j4ou9O)

The mean is halved (1/2) as a convenience for the computation of the gradient descent, as the derivative term of the square function will cancel out the 1/2 term.
