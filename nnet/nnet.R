library(caret)
library(rgl)
library(car)
library(MASS)
library(e1071)
library(SDMTools)
install.packages('SDMTools')

# Using full data from matches
setwd("~/Documents/Uni/4o/APA/APA-Practica")

predict_from_model <- function(model, test) {
  p <- predict(model, test)
  a <- as.numeric(p) - 1
  b <- as.numeric(test$winner) - 1
  cm <- table(test$winner,p)
  N.test <- nrow(test)
  MSE <- sum((a-b)^2/ N.test)
  model.accuracy <- sum(diag(cm))/sum(cm)
  print(model.accuracy)
  print(MSE)
}

set.seed(123)

matches <- read.csv('20k_matches.csv', header = TRUE, sep = ',')
matches$winner = as.factor(matches$winner)
dataf <- as.data.frame(matches)
colSums(is.na(matches))
N <- nrow(matches)

smp_size <- floor(0.75 * N)
train_ind <- sample(seq_len(N), size = smp_size)

train <- matches[train_ind, ]
test <- matches[-train_ind, ]

decays <- 10^seq(-3,0,by=0.1)
trc <- trainControl (method="cv", number=3)

# 20 neurones
nnet.20 <- train (winner ~., data = train, linout=FALSE, method='nnet', maxit = 500, trace = FALSE,tuneGrid = expand.grid(.size=20,.decay=0.1), trControl=trc)
nnet.20$results
nnet.20$bestTune

predict_from_model(nnet.20, test)
save(nnet.20, file = "nnet/nnet.20.regul")

# 10 neurones
nnet.10 <- train (winner ~., data = train, linout=FALSE, method='nnet', maxit = 500, trace = FALSE,tuneGrid = expand.grid(.size=10,.decay=0.1), trControl=trc)
predict_from_model(nnet.10, test)
save(nnet.5, file = "nnet/nnet.10.regul")

# 5 neurones
trc <- trainControl (method="repeatedcv", number=10, repeats=10)

nnet.5 <- train (winner ~., data = train, linout=FALSE, method='nnet', maxit = 500, trace = FALSE,tuneGrid = expand.grid(.size=5,.decay=decays), trControl=trc)
predict_from_model(nnet.5, test)
save(nnet.5, file = "nnet/nnet.5.regul")


