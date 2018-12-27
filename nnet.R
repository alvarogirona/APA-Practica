library(caret)
library(rgl)
library(car)
library(MASS)
library(e1071)
library(SDMTools)
install.packages('SDMTools')

# Using full data from matches

matches <- read.csv('900games.csv', header = TRUE, sep = '\t')
matches <- matches[1:49]
matches$winner = as.factor(matches$winner)

matches_validation <- read.csv('100games_validation.csv', header = TRUE, sep = '\t')
matches_validation <- matches_validation[1:49]
matches_validation$winner = as.factor(matches_validation$winner)

#decays <- 10^seq(-3,0,by=0.1)
trc <- trainControl (method="cv", number=3)

n100.5 <- train (winner ~., data = matches, linout=FALSE, method='nnet', maxit = 500, trace = FALSE,tuneGrid = expand.grid(.size=10,.decay=0.1), trControl=trc)
n100.5$results
n100.5$bestTune

p <- predict(n100.5, matches_validation)
a <- as.numeric(p) - 1
b <- as.numeric(matches_validation$winner) - 1

MSE <- sum((a-b)^2/ 100)

save(n100.5, file = "n100.5.regul")

# Using only the deltas
matches <- read.csv('900matches_deltas.csv', header = TRUE, sep = '\t')
ncol(matches)
matches <- matches[1:29]
matches$winner = as.factor(matches$winner)

matches_validation <- read.csv('100matches_deltas_validation.csv', header = TRUE, sep = '\t')
matches_validation <- matches_validation[1:29]
matches_validation$winner = as.factor(matches_validation$winner)

#decays <- 10^seq(-3,0,by=0.1)
trc <- trainControl (method="cv", number=3)

n900.10 <- train (winner ~., data = matches, linout=FALSE, method='nnet', maxit = 500, trace = FALSE,tuneGrid = expand.grid(.size=10,.decay=0.1), trControl=trc)
n900.10$results
n900.10$bestTune

p <- predict(n900.10, matches_validation)
a <- as.numeric(p) -1
b <- as.numeric(matches_validation$winner) -1

MSE <- sum((a-b)^2/ 100)

MSE

confusion.matrix(b, a)

save(n900.10, file = "n900.10.regul")


