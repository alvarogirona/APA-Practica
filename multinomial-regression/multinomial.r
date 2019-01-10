library(nnet)

set.seed(123)
setwd('Desktop/APA-Practica/project/APA-Practica/')
matches <- read.csv('20k_matches.csv', header = TRUE, sep = ',')
matches$winner = as.factor(matches$winner)
dataf <- as.data.frame(matches)
colSums(is.na(matches))
N <- nrow(matches)

# Normalitzar les dades
## Equip 0
apply(matches, 2, sd)
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


# Creacio del model de regressió logística multinomial
mult.reg <- multinom(train$winner ~ ., data = train[,-1])

p <- predict(mult.reg, data = train[,-1])
train.error <- sum(p != train$winner)/nrow(train)
train.error

t <- predict(mult.reg, test[,-1])
test.error <- sum(as.numeric(t) != as.numeric(test$winner))/nrow(test)
test.error

save(mult.reg, file = "multinomial-regression/mult.reg.regul")
