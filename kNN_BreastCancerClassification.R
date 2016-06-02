# Diagnosing Breast Cancer with kNN Algorithm

download.file(url='https://raw.githubusercontent.com/stedy/Machine-Learning-with-R-datasets/master/wisc_bc_data.csv',destfile='wisc_bc_data.csv',method='curl')
wbcd <- read.csv("./wisc_bc_data.csv", stringsAsFactors = FALSE)
wbcd <- wbcd[-1]
wbcd$diagnosis <- factor(wbcd$diagnosis, levels=c("B", "M"),
                         labels=c("Benign", "Malignant"))
round(prop.table(table(wbcd$diagnosis)) * 100, digits = 1)

# Normalization function
normalize <- function(x){
  return ((x - min(x)) / (max(x) - min(x)))
}

wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))

# Data Prep
wbcd_train <- wbcd_n[1:469, ]
wbcd_test <- wbcd_n[470:569, ]
 # Labels
wbcd_train_labels <- wbcd[1:469, 1]
wbcd_test_labels <- wbcd[470:569, 1]

# class package
install.packages("class")
library(class)

# Model
wbcd_test_pred  <- knn(train=wbcd_train, test=wbcd_test,
                       cl=wbcd_train_labels, k=21)

# Evaluation
# install.packages("gmodels")
library(gmodels)
CrossTable(x=wbcd_test_labels, y=wbcd_test_pred,
           prop.chisq=FALSE)