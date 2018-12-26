library(caret)
library(rgl)
library(car)
library(MASS)
library(e1071)

matches <- read.csv('100games.csv', header = TRUE, sep = '\t')
matches <- matches[1:49]
matches$winner = as.factor(matches$winner)

matches_validation <- read.csv('100games_validation.csv', header = TRUE, sep = '\t')
matches <- matches[1:49]
matches$winner = as.factor(matches$winner)

decays <- 10^seq(-3,0,by=0.1)
trc <- trainControl (method="repeatedcv", number=10, repeats=10)

n100.5 <- train (winner ~., data = matches, linout=FALSE, method='nnet', maxit = 500, trace = FALSE,tuneGrid = expand.grid(.size=5,.decay=decays), trControl=trc)
n100.5$results
n100.5$bestTune

p <- predict(n100.5, matches_validation)
a <- as.numeric(p) - 1
b <- as.numeric(matches_validation$winner)

MSE <- sum((a-b)^2/ 100)

save(n100.5, file = "n100.5.regul")


