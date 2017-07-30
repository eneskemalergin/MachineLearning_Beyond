## Blueprint for Gradient Boosting Machine Algorithms
# Author : Enes Kemal Ergin

import numpy as np
import pandas as pd

from sklearn.ensemble import GradientBoostingClassifier


# Import cleaned data
train = 0
train_x = 0
train_y = 0

test = 0
test_x = 0

# GBM with Random Parameters
gbm1=GradientBoostingClassifier(learning_rate=0.1, min_samples_split=500,
                                min_samples_leaf=50,max_depth=8,max_features='sqrt',
                                subsample=0.8,random_state=10)

gbm1.fit(train_x,train_y)
y_pred = gbm1.predict_proba(test_x)
