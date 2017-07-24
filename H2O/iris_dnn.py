# Import the library
import h2o
from h2o.estimators.deeplearning import H2ODeepLearningEstimator

# Initialize the instance for h2o
h2o.init()

# Just specifiying the mother folder where the data sits
data_path = '../data/'

# Import the data using h2o's import_file function
data = h2o.import_file(data_path + 'iris_wheader.csv')

# class column will be our y vector
y = 'class'

# We are also assigning name of column in the data to x as a list
x = data.names

# Removing the class column name from x
x.remove(y)

# Create a model blueprint from the h2o package store in m
m = H2ODeepLearningEstimator()

# Train the model with x features, and y labels of train data
m.train(x, y, train)

# Then we will make a prediction with our model using test data
p = m.predict(test)

# printing the confusion matrix
print(m.confusion_matrix(train))

# For the summary statistics of the trained model
print(m.model_performance())
