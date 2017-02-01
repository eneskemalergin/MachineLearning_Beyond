# Logistic Regression Model

## Cost Functions

We cannot use the same cost function that we use for linear regression because the Logistic Function will cause the output to be wavy, causing many local optima. In other words, it will not be a convex function.

> Convex is bowl shaped, only 1 minimum point without any local minima.

Instead, our cost function for logistic regression looks like:

![](http://www.sciweavers.org/tex2img.php?eq=J%28%5Ctheta%29%20%3D%20%5Cdfrac%7B1%7D%7Bm%7D%20%5Csum_%7Bi%3D1%7D%5Em%20%5Cmathrm%7BCost%7D%28h_%5Ctheta%28x%5E%7B%28i%29%7D%29%2Cy%5E%7B%28i%29%7D%29%20%0A&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)

![](http://www.sciweavers.org/tex2img.php?eq=%5Cmathrm%7BCost%7D%28h_%5Ctheta%28x%29%2Cy%29%20%3D%20-%5Clog%28h_%5Ctheta%28x%29%29%20%5C%3B%20%26%20%5Ctext%7Bif%20y%20%3D%201%7D&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)

![](http://www.sciweavers.org/tex2img.php?eq=%5Cmathrm%7BCost%7D%28h_%5Ctheta%28x%29%2Cy%29%20%3D%20-%5Clog%281-h_%5Ctheta%28x%29%29%20%5C%3B%20%26%20%5Ctext%7Bif%20y%20%3D%200%7D&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)

When y = 1, we get the following plot for J(θ) vs hθ(x):

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Q9sX8nnxEeamDApmnD43Fw_1cb67ecfac77b134606532f5caf98ee4_Logistic_regression_cost_function_positive_class.png?expiry=1486080000000&hmac=lRauO0A-jn5NEcCdsRo2AAQCX885VF4XQli9NzyNOwg)

Similarly, when y = 0, we get the following plot for J(θ) vs hθ(x):

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Ut7vvXnxEead-BJkoDOYOw_f719f2858d78dd66d80c5ec0d8e6b3fa_Logistic_regression_cost_function_negative_class.png?expiry=1486080000000&hmac=W99-kM_D4SJDOXjWF0NnmDw2s2kdrfKHS-FkpRetV5g)


Note that writing the cost function in this way guarantees that J(θ) is convex for logistic regression.

## Simplified Cost Function and Gradient Descent

We can compress our cost function's two conditional cases into one case:

![](http://www.sciweavers.org/tex2img.php?eq=%5Cmathrm%7BCost%7D%28h_%5Ctheta%28x%29%2Cy%29%20%3D%20-%20y%20%5C%3B%20%5Clog%28h_%5Ctheta%28x%29%29%20-%20%281%20-%20y%29%20%5Clog%281%20-%20h_%5Ctheta%28x%29%29&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)

Notice that when y is equal to 1, then the second term ```(1−y)log(1−hθ(x))``` will be zero and will not affect the result. If y is equal to 0, then the first term ```−ylog(hθ(x))``` will be zero and will not affect the result.

We can fully write out our entire cost function as follows:

![](http://www.sciweavers.org/tex2img.php?eq=J%28%5Ctheta%29%20%3D%20-%20%5Cfrac%7B1%7D%7Bm%7D%20%5Cdisplaystyle%20%5Csum_%7Bi%3D1%7D%5Em%20%5By%5E%7B%28i%29%7D%5Clog%20%28h_%5Ctheta%20%28x%5E%7B%28i%29%7D%29%29%20%2B%20%281%20-%20y%5E%7B%28i%29%7D%29%5Clog%20%281%20-%20h_%5Ctheta%28x%5E%7B%28i%29%7D%29%29%5D&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)

A vectorized implementation is:

![](http://www.sciweavers.org/tex2img.php?eq=h%20%3D%20g%28X%5Ctheta%29&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)

![](http://www.sciweavers.org/tex2img.php?eq=J%28%5Ctheta%29%20%3D%20%5Cfrac%7B1%7D%7Bm%7D%20%5Ccdot%20%5Cleft%28-y%5E%7BT%7D%5Clog%28h%29-%281-y%29%5E%7BT%7D%5Clog%281-h%29%5Cright%29%20%5Cend%7Balign%2A%7D&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)

### Gradient Descent

Remember that the general form of gradient descent is:

Repeat {

  ![](http://www.sciweavers.org/tex2img.php?eq=%20%5Ctheta_j%20%3A%3D%20%5Ctheta_j%20-%20%5Calpha%20%5Cdfrac%7B%5Cpartial%7D%7B%5Cpartial%20%5Ctheta_j%7DJ%28%5Ctheta%29&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)

}

We can work out the derivative part using calculus to get:

Repeat {

  ![](http://www.sciweavers.org/tex2img.php?eq=%5Ctheta_j%20%3A%3D%20%5Ctheta_j%20-%20%5Cfrac%7B%5Calpha%7D%7Bm%7D%20%5Csum_%7Bi%3D1%7D%5Em%20%28h_%5Ctheta%28x%5E%7B%28i%29%7D%29%20-%20y%5E%7B%28i%29%7D%29%20x_j%5E%7B%28i%29%7D&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)

}

Notice that this algorithm is identical to the one we used in linear regression. We still have to simultaneously update all values in theta.

A vectorized implementation is:

![](http://www.sciweavers.org/tex2img.php?eq=%5Ctheta%20%3A%3D%20%5Ctheta%20-%20%5Cfrac%7B%5Calpha%7D%7Bm%7D%20X%5E%7BT%7D%20%28g%28X%20%5Ctheta%20%29%20-%20%5Cvec%7By%7D%29&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0)
