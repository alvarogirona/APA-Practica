setwd("~/Documents/Uni/4o/APA/APA-Practica")
matches <- read.csv('20k_matches.csv', header = TRUE, sep = ',')
# Comprovar la desviacio standard
apply(matches, 2, sd)
# Comprovar valors nuls
colSums(is.na(matches))
