setwd("~/Documents/Uni/4o/APA/APA-Practica")
matches <- read.csv('20k_matches.csv', header = TRUE, sep = ',')
# Comprovar la desviacio standard
apply(matches, 2, sd)
# Comprovar valors nuls
colSums(is.na(matches))

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
