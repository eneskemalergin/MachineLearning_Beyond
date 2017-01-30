# Classification and Representation

## Classification

To attempt classification, one method is to use linear regression and map all predictions greater than 0.5 as a 1 and all less than 0.5 as a 0. __However, this method doesn't work well because classification is not actually a linear function.__

The classification problem is just like the regression problem, except that the values y we now want to predict take on only a small number of discrete values. For now, we will focus on the binary classification problem in which y can take on only two values, 0 and 1. (Most of what we say here will also generalize to the multiple-class case.)

__Logistic Regression is a classification problem__

## Hypothesis Representation

We could approach the classification problem ignoring the fact that y is discrete-valued, and use our old linear regression algorithm to try to predict y given x. However, it is easy to construct examples where this method performs very poorly.

Intuitively, it also doesn’t make sense for ```hθ(x)``` to take values larger than 1 or smaller than 0 when we know that ```y ∈ {0, 1}```. To fix this, let’s change the form for our hypotheses ```hθ(x)``` to satisfy ```0 ≤ hθ(x)≤ 1```. This is accomplished by plugging ```θTx``` into the Logistic Function.

Our new form uses the "Sigmoid Function," also called the "Logistic Function":

- ![Function](http://www.sciweavers.org/tex2img.php?eq=h_%5Ctheta%20%28x%29%20%3D%20g%20%28%20%5Ctheta%5ET%20x%20%29%20%20&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)
- ![](http://www.sciweavers.org/tex2img.php?eq=z%20%3D%20%5Ctheta%5ET%20x&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)
- ![](http://www.sciweavers.org/tex2img.php?eq=g%28z%29%20%3D%20%5Cdfrac%7B1%7D%7B1%20%2B%20e%5E%7B-z%7D%7D&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)

![Sigmoid Function ](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/1WFqZHntEead-BJkoDOYOw_2413fbec8ff9fa1f19aaf78265b8a33b_Logistic_function.png?expiry=1485907200000&hmac=PhsS3S6irXMx0-d9DbhP0Vgp_z5KJNf6wDEh6l-lVoE)

The function g(z), shown here, maps any real number to the (0, 1) interval, making it useful for transforming an arbitrary-valued function into a function better suited for classification.

The function ```hθ(x)``` will give us the probability that our output is 1. For example, ```hθ(x)=0.7``` gives us a probability of 70% that our output is 1. Our probability that our prediction is 0 is just the complement of our probability that it is 1 (e.g. if probability that it is 1 is 70%, then the probability that it is 0 is 30%).

![](http://www.sciweavers.org/tex2img.php?eq=h_%5Ctheta%28x%29%20%3D%20P%28y%3D1%20%7C%20x%20%3B%20%5Ctheta%29%20%3D%201%20-%20P%28y%3D0%20%7C%20x%20%3B%20%5Ctheta%29%20&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)

![](http://www.sciweavers.org/tex2img.php?eq=P%28y%20%3D%200%20%7C%20x%3B%5Ctheta%29%20%2B%20P%28y%20%3D%201%20%7C%20x%20%3B%20%5Ctheta%29%20%3D%201&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)


## Decision Boundary

In order to get our discrete 0 or 1 classification, we can translate the output of the hypothesis function as follows:

![](http://www.sciweavers.org/tex2img.php?eq=h_%5Ctheta%28x%29%20%5Cgeq%200.5%20%5Crightarrow%20y%20%3D%201%20%0A&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)

![](http://www.sciweavers.org/tex2img.php?eq=h_%5Ctheta%28x%29%20%3C%200.5%20%5Crightarrow%20y%20%3D%200%20&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)

The way our logistic function g behaves is that when its input is greater than or equal to zero, its output is greater than or equal to 0.5:

```
g(z) >= 0.5 ,

when z >= 0
```

![](http://www.sciweavers.org/tex2img.php?eq=%0Az%3D0%2C%20e%5E%7B0%7D%3D1%20%5CRightarrow%20g%28z%29%3D1%2F2%0A%0Az%20%5Cto%20%5Cinfty%2C%20e%5E%7B-%5Cinfty%7D%20%5Cto%200%20%5CRightarrow%20g%28z%29%3D1%20%0A%0A%20z%20%5Cto%20-%5Cinfty%2C%20e%5E%7B%5Cinfty%7D%5Cto%20%5Cinfty%20%5CRightarrow%20g%28z%29%3D0%20&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)

So if our input to g is θTX, then that means:

![](http://www.sciweavers.org/tex2img.php?eq=%26%20h_%5Ctheta%28x%29%20%3D%20g%28%5Ctheta%5ET%20x%29%20%5Cgeq%200.5%20%5Cnewline%26%20when%20%5C%3B%20%5Ctheta%5ET%20x%20%5Cgeq%200%5Cend%7Balign%2A%7D&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)

From these statements we can now say:

![](http://www.sciweavers.org/tex2img.php?eq=%0A%5Ctheta%5ET%20x%20%5Cgeq%200%20%5CRightarrow%20y%20%3D%201%20%0A%0A%5Ctheta%5ET%20x%20%3C%200%20%5CRightarrow%20y%20%3D%200&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)


The __decision boundary__ is the line that separates the area where y = 0 and where y = 1. It is created by our hypothesis function.
