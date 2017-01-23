## Normal Equation

Normal equation method is another method to minimizing J like gradient descent. It uses heavily matrix operations rather than using iterative approach to find minimum.

![](http://bit.ly/2jQWx8C)


There is no need to do feature scaling with the normal equation.

__Gradient Descent:__
- Need to choose alpha, learning rate
- Need many iterations
- Complexity of O(kn^2)
- Works well when n is large

__Normal Equation:__
- No need to choose alpha, learning rate
- No need to iterate
- Complexity of O(n^3) to calculate ```X^T*X```

If we have really large number of features like more than 10,000, it's not good to go with Normal Equation. We should choose gradient descent method.


## Normal Equation Noninvertibility

If ```X^T*X``` is noninvertible, the common causes might be having :

- Redundant features, where two features are very closely related (i.e. they are linearly dependent)
- Too many features (e.g. m ≤ n). In this case, delete some features or use "regularization" (to be explained in a later lesson).

Solutions to the above problems include deleting a feature that is linearly dependent with another or deleting one or more features when there are too many features.
