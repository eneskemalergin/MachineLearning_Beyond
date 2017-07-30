## Blueprint for Random Forest Implementation
import numpy as np
import pandas as pd

from sklearn.ensemble import RandomForestClassifier

# Import cleaned data
train = 0
train_x = 0
train_y = 0

test = 0
test_x = 0


classifier = RandomForestClassifier(n_estimators=1000)
classifier.fit(train_x,train_y)

y_pred=classifier.predict_proba(test_x)
