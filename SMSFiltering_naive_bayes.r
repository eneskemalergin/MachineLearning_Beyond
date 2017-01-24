# SMS spam filtering using Naive Bayes 

# Get data
download.file(url="https://raw.githubusercontent.com/brenden17/sklearnlab/master/spam/sms_spam.csv", destfile="sms_spam.csv", method="curl")
sms_raw <- read.csv("./sms_spam.csv", stringsAsFactors = FALSE)

# Processing text data

sms_raw$type <- factor(sms_raw$type)

install.packages("tm")
library(tm)

sms_corpus <- Corpus(VectorSource(sms_raw$text))
inspect(corpus_clean[1:3])

# tm_map() is transforming with mapping
corpus_clean <- tm_map(sms_corpus, content_transformer(tolower)) # all to lowercase
corpus_clean <- tm_map(corpus_clean, content_transformer(removeNumbers)) # get rid of all numbers

corpus_clean <- tm_map(corpus_clean, content_transformer(removeWords), stopwords()) # remove all stopwords
corpus_clean <- tm_map(corpus_clean, content_transformer(removePunctuation)) # removes all punctuation
corpus_clean <- tm_map(corpus_clean, content_transformer(stripWhitespace)) # removes additional white space

# After removing is done we can check our SMS messages
inspect(corpus_clean[1:3])

# creating sparse matrix
sms_dtm <- DocumentTermMatrix(corpus_clean)


# train and test data creation
#Splitting raw data frame
sms_raw_train <- sms_raw[1:4169, ]
sms_raw_test <- sms_raw[4170:5559, ]

# splitting document-term matrix
sms_dtm_train <- sms_dtm[1:4169, ]
sms_dtm_test <- sms_dtm[4170:5559, ]

# splitting corpus
sms_corpus_train <- corpus_clean[1:4169]
sms_corpus_test <- corpus_clean[4170:5559]

# Proportion of spam in the training and test data frames
prop.table(table(sms_raw_train$type))

prop.table(table(sms_raw_test$type))

# Visualize
install.packages("wordcloud")
library(wordcloud)

# Create the wordcloud diagram, most frequent ones will be close to the center
wordcloud(sms_corpus_train, min.freq = 40, random.order = FALSE)


# Compare ham and spam
# subset spam ones
spam <- subset(sms_raw_train, type=="spam")

# subset ham ones
ham <- subset(sms_raw_train, type=="ham")

wordcloud(spam$text, max.word = 40, scale= c(3, 0.5))
wordcloud(ham$text, max.word = 40, scale= c(3, 0.5))


# finding frequent words in more than 5 SMS using tm function
sms_dict <- c(findFreqTerms(sms_dtm_train, 5) )

# limit train data from dictionary created
sms_train <- DocumentTermMatrix(sms_corpus_train, list(dictionary = sms_dict))

# limit test data from dictionary created
sms_test <- DocumentTermMatrix(sms_corpus_train, list(dictionary=sms_dict))

convert_counts <- function(x) {
  x <- ifelse(x > 0, 1, 0)
  x <- factor(x, levels=c(0,1), labels=c("'No'", "'Yes'"))
  return(x)
}

sms_train <- apply(sms_train, MARGIN = 2, convert_counts)
sms_test <- apply(sms_test, MARGIN = 2, convert_counts)

# Train a model
install.packages("e1071")
library(e1071)

# Build model
sms_classifier <- naiveBayes(sms_train, sms_raw_train$type)
# Predict
sms_test_pred <- predict(sms_classifier, sms_test)

library(gmodels)
CrossTable(sms_test_pred, sms_raw_test$type,
           prop.chisq = FALSE, prop.t=FALSE,
           dnn=c('predicted', 'actual'))