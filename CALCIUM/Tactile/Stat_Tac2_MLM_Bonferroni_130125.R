
-----------------------------------------------------------------------
  # AUC Trials age effect - LMM_Bonferroni
-----------------------------------------------------------------------


# Charger les packages nécessaires
library(lme4)
library(lmerTest)
library(emmeans)
library(dplyr)
library(readxl)
library(openxlsx)

# Charger les données depuis le fichier Excel
tmp <- read_excel("G:/PhD/Experimentation/Calcium_imaging_WF/analysis_DFF/raw_data_tac2/Quantif_by_Periods/AUC_persec_Znorm_by_Period_wo_index_tac2.xlsx")

# Vérifier les noms des colonnes
print(colnames(tmp))

# Vérifier la structure des données
str(tmp)

# Définir les niveaux de référence
tmp$Period <- relevel(factor(tmp$Period), ref = "TB")
tmp$Age <- relevel(factor(tmp$Age), ref = "P6")

# Ajuster le modèle linéaire mixte avec lmerTest
model <- lmer(AUC_Znorm_persec ~ Period * Age + (1 | Trial) + (1 | Animal), data = tmp)

# Analyse de la variance avec la méthode de Kenward-Roger
anova.AUC_Znorm_persec <- anova(model, ddf = "Kenward-Roger")

# Convertir les résultats d'ANOVA en DataFrame
anova_df <- as.data.frame(anova.AUC_Znorm_persec)

# Obtenir les moyennes marginales
#emm <- emmeans(model, ~ Period * Age)
emm <- emmeans(model, ~ Period * Age)

# Comparaisons post-hoc avec correction pour les comparaisons multiples
posthoc <- pairs(emm, simple = "each", adjust = "Bonferroni")

# Résumé des résultats des comparaisons post-hoc
summary_posthoc <- rbind(posthoc[[1]], posthoc[[2]], adjust = "Bonferroni")

# Créer un nouveau fichier Excel
#output_file <- "G:/PhD/Experimentation/Calcium_imaging_WF/analysis_DFF/raw_data_Thq/Result_stat/Stat_AUC_persec_Znorm.xlsx"
output_file <- "G:/PhD/Experimentation/Calcium_imaging_WF/analysis_DFF/raw_data_tac2/Result_stat_R_tac2/Stat_AUC_trials_age.xlsx"

# Vérifier si le fichier existe, sinon le créer
if (!file.exists(output_file)) {
  wb <- createWorkbook()
} else {
  wb <- loadWorkbook(output_file)
}

# Ajouter une nouvelle feuille pour les résultats de l'ANOVA
addWorksheet(wb, "ANOVA_Results")
writeData(wb, "ANOVA_Results", anova_df, rowNames = TRUE)

# Ajouter une nouvelle feuille pour les résultats post-hoc
addWorksheet(wb, "Posthoc_Results")
writeData(wb, "Posthoc_Results", as.data.frame(summary_posthoc), rowNames = TRUE)

# Sauvegarder le fichier modifié en écrasant l'ancien fichier
saveWorkbook(wb, output_file, overwrite = TRUE)

cat("Feuilles ANOVA_Results et Posthoc_Results sauvegardées avec succès.\n")

# Lire les résultats d'ANOVA et Posthoc à partir du fichier
anova_results <- read_excel(output_file, sheet = "ANOVA_Results")
posthoc_results <- read_excel(output_file, sheet = "Posthoc_Results")

# Vérifier les noms des colonnes
print(colnames(anova_results))
print(colnames(posthoc_results))

# Ajouter la colonne "sig" pour ANOVA
anova_results$sig <- ifelse(is.na(anova_results$`Pr(>F)`) | is.nan(anova_results$`Pr(>F)`), NA,
                            ifelse(anova_results$`Pr(>F)` < 0.001, "***",
                                   ifelse(anova_results$`Pr(>F)` < 0.01, "**",
                                          ifelse(anova_results$`Pr(>F)` < 0.05, "*", ""))))

# Ajouter la colonne "sig" pour Post-hoc
posthoc_results$sig <- ifelse(is.na(posthoc_results$p.value) | is.nan(posthoc_results$p.value), NA,
                              ifelse(posthoc_results$p.value < 0.001, "***",
                                     ifelse(posthoc_results$p.value < 0.01, "**",
                                            ifelse(posthoc_results$p.value < 0.05, "*", ""))))

# Créer un nouveau fichier Excel pour sauvegarder les résultats modifiés
output_file_modified <- "G:/PhD/Experimentation/Calcium_imaging_WF/analysis_DFF/raw_data_tac2/Result_stat_R_tac2/Stat_AUC_trials_age.xlsx"
#output_file_modified <- "G:/PhD/Experimentation/Calcium_imaging_WF/analysis_DFF/raw_data_Thq/Result_stat/Stat_AUC_persec_Znorm.xlsx"


# Créer un nouveau classeur
wb <- createWorkbook()

# Ajouter une feuille pour les résultats d'ANOVA
addWorksheet(wb, "ANOVA_Results")
writeData(wb, "ANOVA_Results", anova_results, rowNames = TRUE)

# Ajouter une feuille pour les résultats post-hoc
addWorksheet(wb, "Posthoc_Results")
writeData(wb, "Posthoc_Results", posthoc_results, rowNames = TRUE)

# Sauvegarder le nouveau fichier Excel
saveWorkbook(wb, output_file_modified, overwrite = TRUE)

cat("Les résultats ont été sauvegardés dans le fichier :", output_file_modified, "\n")



---------------------------------------------------------------------------------------------------------------------------------------------------


  
  
  
-----------------------------------------------------------------------
# AUC Trials sex effect - LMM_Bonferroni
-----------------------------------------------------------------------
  
  
# Charger les packages nécessaires
library(lme4)
library(lmerTest)
library(emmeans)
library(dplyr)
library(readxl)
library(openxlsx)

# Charger les données depuis le fichier Excel
tmp <- read_excel("G:/PhD/Experimentation/Calcium_imaging_WF/analysis_DFF/raw_data_tac2/Quantif_by_Periods/AUC_persec_Znorm_by_Period_wo_index_tac2.xlsx")

# Vérifier les noms des colonnes
print(colnames(tmp))

# Vérifier la structure des données
str(tmp)

# Définir les niveaux de référence
tmp$Period <- relevel(factor(tmp$Period), ref = "TB")
tmp$Sexe <- relevel(factor(tmp$Sexe), ref = "M")

# Ajuster le modèle linéaire mixte avec lmerTest
model <- lmer(AUC_Znorm_persec ~ Period * Sexe + (1 | Trial) + (1 | Animal), data = tmp)

# Analyse de la variance avec la méthode de Kenward-Roger
anova.AUC_Znorm_persec <- anova(model, ddf = "Kenward-Roger")

# Convertir les résultats d'ANOVA en DataFrame
anova_df <- as.data.frame(anova.AUC_Znorm_persec)

# Obtenir les moyennes marginales
emm <- emmeans(model, ~ Period * Sexe)

# Comparaisons post-hoc avec correction pour les comparaisons multiples
posthoc <- pairs(emm, simple = "each", adjust = "Bonferroni")

# Résumé des résultats des comparaisons post-hoc
summary_posthoc <- rbind(posthoc[[1]], posthoc[[2]], adjust = "Bonferroni")

# Créer un nouveau fichier Excel
#output_file <- "G:/PhD/Experimentation/Calcium_imaging_WF/analysis_DFF/raw_data_Thq/Result_stat/Stat_AUC_persec_Znorm.xlsx"
output_file <- "G:/PhD/Experimentation/Calcium_imaging_WF/analysis_DFF/raw_data_tac2/Result_stat_R_tac2/Stat_AUC_trials_sex.xlsx"

# Vérifier si le fichier existe, sinon le créer
if (!file.exists(output_file)) {
  wb <- createWorkbook()
} else {
  wb <- loadWorkbook(output_file)
}

# Ajouter une nouvelle feuille pour les résultats de l'ANOVA
addWorksheet(wb, "ANOVA_Results")
writeData(wb, "ANOVA_Results", anova_df, rowNames = TRUE)

# Ajouter une nouvelle feuille pour les résultats post-hoc
addWorksheet(wb, "Posthoc_Results")
writeData(wb, "Posthoc_Results", as.data.frame(summary_posthoc), rowNames = TRUE)

# Sauvegarder le fichier modifié en écrasant l'ancien fichier
saveWorkbook(wb, output_file, overwrite = TRUE)

cat("Feuilles ANOVA_Results et Posthoc_Results sauvegardées avec succès.\n")

# Lire les résultats d'ANOVA et Posthoc à partir du fichier
anova_results <- read_excel(output_file, sheet = "ANOVA_Results")
posthoc_results <- read_excel(output_file, sheet = "Posthoc_Results")

# Vérifier les noms des colonnes
print(colnames(anova_results))
print(colnames(posthoc_results))

# Ajouter la colonne "sig" pour ANOVA
anova_results$sig <- ifelse(is.na(anova_results$`Pr(>F)`) | is.nan(anova_results$`Pr(>F)`), NA,
                            ifelse(anova_results$`Pr(>F)` < 0.001, "***",
                                   ifelse(anova_results$`Pr(>F)` < 0.01, "**",
                                          ifelse(anova_results$`Pr(>F)` < 0.05, "*", ""))))

# Ajouter la colonne "sig" pour Post-hoc
posthoc_results$sig <- ifelse(is.na(posthoc_results$p.value) | is.nan(posthoc_results$p.value), NA,
                              ifelse(posthoc_results$p.value < 0.001, "***",
                                     ifelse(posthoc_results$p.value < 0.01, "**",
                                            ifelse(posthoc_results$p.value < 0.05, "*", ""))))

# Créer un nouveau fichier Excel pour sauvegarder les résultats modifiés
output_file_modified <- "G:/PhD/Experimentation/Calcium_imaging_WF/analysis_DFF/raw_data_tac2/Result_stat_R_tac2/Stat_AUC_trials_sex.xlsx"
#output_file_modified <- "G:/PhD/Experimentation/Calcium_imaging_WF/analysis_DFF/raw_data_Thq/Result_stat/Stat_AUC_persec_Znorm.xlsx"


# Créer un nouveau classeur
wb <- createWorkbook()

# Ajouter une feuille pour les résultats d'ANOVA
addWorksheet(wb, "ANOVA_Results")
writeData(wb, "ANOVA_Results", anova_results, rowNames = TRUE)

# Ajouter une feuille pour les résultats post-hoc
addWorksheet(wb, "Posthoc_Results")
writeData(wb, "Posthoc_Results", posthoc_results, rowNames = TRUE)

# Sauvegarder le nouveau fichier Excel
saveWorkbook(wb, output_file_modified, overwrite = TRUE)

cat("Les résultats ont été sauvegardés dans le fichier :", output_file_modified, "\n")






