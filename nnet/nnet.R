library(caret)
library(rgl)
library(car)
library(MASS)
library(e1071)
library(SDMTools)
#install.packages('SDMTools')

# Using full data from matches
setwd("~/Documents/Uni/4o/APA/APA-Practica")

predict_with_model <- function(model, test) {
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
N <- nrow(matches)

# Normalitzar les dades
## Equip 0
matches$t0_cs_min_0_10 = matches$t0_cs_min_0_10/sd(matches$t0_cs_min_0_10)
matches$t0_cs_min_10_20 = matches$t0_cs_min_10_20/sd(matches$t0_cs_min_10_20)

matches$t0_xp_min_0_10 = matches$t0_xp_min_0_10/sd(matches$t0_xp_min_0_10)
matches$t0_xp_min_10_20 = matches$t0_xp_min_10_20/sd(matches$t0_xp_min_10_20)

matches$t0_gold_min_0_10 = matches$t0_gold_min_0_10/sd(matches$t0_gold_min_0_10)
matches$t0_gold_min_10_20 = matches$t0_gold_min_10_20/sd(matches$t0_gold_min_10_20)

matches$t0_cs_diff_min_0_10 = matches$t0_cs_diff_min_0_10/sd(matches$t0_cs_diff_min_0_10)
matches$t0_cs_diff_min_10_20 = matches$t0_cs_diff_min_10_20/sd(matches$t0_cs_diff_min_10_20)

matches$t0_xp_diff_min_0_10 = matches$t0_xp_diff_min_0_10/sd(matches$t0_xp_diff_min_0_10)
matches$t0_xp_diff_min_10_20 = matches$t0_xp_diff_min_10_20/sd(matches$t0_xp_diff_min_10_20)

matches$t0_dmg_taken_min_0_10 = matches$t0_dmg_taken_min_0_10/sd(matches$t0_dmg_taken_min_0_10)
matches$t0_dmg_taken_min_10_20 = matches$t0_dmg_taken_min_10_20/sd(matches$t0_dmg_taken_min_10_20)

matches$t0_dmg_taken_diff_0_10 = matches$t0_dmg_taken_diff_0_10/sd(matches$t0_dmg_taken_diff_0_10)
matches$t0_dmg_taken_diff_10_20 = matches$t0_dmg_taken_diff_10_20/sd(matches$t0_dmg_taken_diff_10_20)

matches$t0_c0_wr = matches$t0_c0_wr/sd(matches$t0_c0_wr)
matches$t0_c1_wr = matches$t0_c1_wr/sd(matches$t0_c1_wr)
matches$t0_c2_wr = matches$t0_c2_wr/sd(matches$t0_c2_wr)
matches$t0_c3_wr = matches$t0_c3_wr/sd(matches$t0_c3_wr)
matches$t0_c4_wr = matches$t0_c4_wr/sd(matches$t0_c4_wr)

## Equip 1
matches$t1_cs_min_0_10 = matches$t1_cs_min_0_10/sd(matches$t1_cs_min_0_10)
matches$t1_cs_min_10_20 = matches$t1_cs_min_10_20/sd(matches$t1_cs_min_10_20)

matches$t1_xp_min_0_10 = matches$t1_xp_min_0_10/sd(matches$t1_xp_min_0_10)
matches$t1_xp_min_10_20 = matches$t1_xp_min_10_20/sd(matches$t1_xp_min_10_20)

matches$t1_gold_min_0_10 = matches$t1_gold_min_0_10/sd(matches$t1_gold_min_0_10)
matches$t1_gold_min_10_20 = matches$t1_gold_min_10_20/sd(matches$t1_gold_min_10_20)

matches$t1_cs_diff_min_0_10 = matches$t1_cs_diff_min_0_10/sd(matches$t1_cs_diff_min_0_10)
matches$t1_cs_diff_min_10_20 = matches$t1_cs_diff_min_10_20/sd(matches$t1_cs_diff_min_10_20)

matches$t1_xp_diff_min_0_10 = matches$t1_xp_diff_min_0_10/sd(matches$t1_xp_diff_min_0_10)
matches$t1_xp_diff_min_10_20 = matches$t1_xp_diff_min_10_20/sd(matches$t1_xp_diff_min_10_20)

matches$t1_dmg_taken_min_0_10 = matches$t1_dmg_taken_min_0_10/sd(matches$t1_dmg_taken_min_0_10)
matches$t1_dmg_taken_min_10_20 = matches$t1_dmg_taken_min_10_20/sd(matches$t1_dmg_taken_min_10_20)

matches$t1_dmg_taken_diff_0_10 = matches$t1_dmg_taken_diff_0_10/sd(matches$t1_dmg_taken_diff_0_10)
matches$t1_dmg_taken_diff_10_20 = matches$t1_dmg_taken_diff_10_20/sd(matches$t1_dmg_taken_diff_10_20)

matches$t1_c0_wr = matches$t1_c0_wr/sd(matches$t1_c0_wr)
matches$t1_c1_wr = matches$t1_c1_wr/sd(matches$t1_c1_wr)
matches$t1_c2_wr = matches$t1_c2_wr/sd(matches$t1_c2_wr)
matches$t1_c3_wr = matches$t1_c3_wr/sd(matches$t1_c3_wr)
matches$t1_c4_wr = matches$t1_c4_wr/sd(matches$t1_c4_wr)

# Creacio dels samples

smp_size <- floor(0.75 * N)
train_ind <- sample(seq_len(N), size = smp_size)

train <- matches[train_ind, ]
test <- matches[-train_ind, ]

decays <- 10^seq(-3,0,by=0.1)
trc <- trainControl (method="repeatedcv", number=10, repeats=10)

# 20 neurones
load("nnet/nnet.20.regul")
nnet.20 <- train (winner ~., data = train, linout=FALSE, method='nnet', maxit = 500, trace = FALSE,tuneGrid = expand.grid(.size=20,.decay=decays), trControl=trc)
nnet.20$results
nnet.20$bestTune

predict_with_model(nnet.20, test)
save(nnet.20, file = "nnet/nnet.20.regul")

# 10 neurones
load(file = "nnet/nnet.10.regul")
nnet.10 <- train (winner ~., data = train, linout=FALSE, method='nnet', maxit = 500, trace = FALSE,tuneGrid = expand.grid(.size=10,.decay=decays), trControl=trc)
nnet.10$bestTune
predict_with_model(nnet.10, test)
save(nnet.10, file = "nnet/nnet.10.regul")

# 5 neurones
load(file = "nnet/nnet.5.regul")
nnet.5 <- train (winner ~., data = train, linout=FALSE, method='nnet', maxit = 500, trace = FALSE,tuneGrid = expand.grid(.size=5,.decay=decays), trControl=trc)
nnet.5$bestTune
predict_with_model(nnet.5, test)
save(nnet.5, file = "nnet/nnet.5.regul")


