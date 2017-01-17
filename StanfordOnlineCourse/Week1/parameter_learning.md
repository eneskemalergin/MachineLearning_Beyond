## Gradient Descent

So we have our hypothesis function and we have a way of measuring how well it fits into the data. Now we need to estimate the parameters in the hypothesis function. That's where gradient descent comes in.

![Gradient Descent ](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/bn9SyaDIEeav5QpTGIv-Pg_0d06dca3d225f3de8b5a4a7e92254153_Screenshot-2016-11-01-23.48.26.png?expiry=1484784000000&hmac=KEgSa9prXjtpzMnRkNW5MncIsZR7826Y99Qj9Xcph3c)

Gradient descent algorithm starts with initial ```θ0``` and ```θ1``` then updates the values try to find the lowest point.

repeat until convergence:

![Gradient Descent Algorithm](http://bit.ly/2jvy48K)

where j = 0,1 represents the feature index number.


> But it's really important to keep that in mind that we have to update ```θ0``` and ```θ1``` simultaneously.

![simultaneous update ](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/yr-D1aDMEeai9RKvXdDYag_627e5ab52d5ff941c0fcc741c2b162a0_Screenshot-2016-11-02-00.19.56.png?expiry=1484784000000&hmac=5eMhL95RNmD3tE4W3ZXnAIVX9vZevAX8t843I_9zUEU)

Regardless of the slope's sign for  ![derivative](http://bit.ly/2jvvrUu) ```θ1``` eventually converges to its minimum value.

![Derivative Intuition](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/SMSIxKGUEeav5QpTGIv-Pg_ad3404010579ac16068105cfdc8e950a_Screenshot-2016-11-03-00.05.06.png?expiry=1484784000000&hmac=vq6oEaeTzBpgcUE8LJFfdh9pnxgrI5xxQ2WBHAXp0lo)

On a side note, we should adjust our parameter ```α``` to ensure that the gradient descent algorithm converges in a reasonable time. Failure to converge or too much time to obtain the minimum value imply that our step size is wrong.


After each step, while the point gets closer to the minimum, the derivative's result gets smaller. Without we decreasing the value of ```α```, the steps are getting smaller.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/RDcJ-KGXEeaVChLw2Vaaug_cb782d34d272321e88f202940c36afe9_Screenshot-2016-11-03-00.06.00.png?expiry=1484784000000&hmac=esvgcLgQKj0IQKrViA1360SP-3JurYHFA_jfkjOaAw0)
