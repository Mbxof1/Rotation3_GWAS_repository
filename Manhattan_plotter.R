library(qqman)
library(dplyr)

gwas_weight_pca <- read.csv("[GWAS.assoc.linear FILE PATH]", sep="")
gwas_weight <- gwas_weight_pca[gwas_weight_pca$TEST == "COV1",]

{
  gwas_weight[gwas_weight == "NC_049222.1"] <- as.numeric(1)
  gwas_weight[gwas_weight == "NC_049223.1"] <- as.numeric(2)
  gwas_weight[gwas_weight == "NC_049224.1"] <- as.numeric(3)
  gwas_weight[gwas_weight == "NC_049225.1"] <- as.numeric(4)
  gwas_weight[gwas_weight == "NC_049226.1"] <- as.numeric(5)
  gwas_weight[gwas_weight == "NC_049227.1"] <- as.numeric(6)
  gwas_weight[gwas_weight == "NC_049228.1"] <- as.numeric(7)
  gwas_weight[gwas_weight == "NC_049229.1"] <- as.numeric(8)
  gwas_weight[gwas_weight == "NC_049230.1"] <- as.numeric(9)
  gwas_weight[gwas_weight == "NC_049231.1"] <- as.numeric(10)
  gwas_weight[gwas_weight == "NC_049232.1"] <- as.numeric(11)
  gwas_weight[gwas_weight == "NC_049233.1"] <- as.numeric(12)
  gwas_weight[gwas_weight == "NC_049234.1"] <- as.numeric(13)
  gwas_weight[gwas_weight == "NC_049235.1"] <- as.numeric(14)
  gwas_weight[gwas_weight == "NC_049236.1"] <- as.numeric(15)
  gwas_weight[gwas_weight == "NC_049237.1"] <- as.numeric(16)
  gwas_weight[gwas_weight == "NC_049238.1"] <- as.numeric(17)
  gwas_weight[gwas_weight == "NC_049239.1"] <- as.numeric(18)
  gwas_weight[gwas_weight == "NC_049240.1"] <- as.numeric(19)
  gwas_weight[gwas_weight == "NC_049241.1"] <- as.numeric(20)
  gwas_weight[gwas_weight == "NC_049242.1"] <- as.numeric(21)
  gwas_weight[gwas_weight == "NC_049243.1"] <- as.numeric(22)
  gwas_weight[gwas_weight == "NC_049244.1"] <- as.numeric(23)
  gwas_weight[gwas_weight == "NC_049245.1"] <- as.numeric(24)
  gwas_weight[gwas_weight == "NC_049246.1"] <- as.numeric(25)
  gwas_weight[gwas_weight == "NC_049247.1"] <- as.numeric(26)
  gwas_weight[gwas_weight == "NC_049248.1"] <- as.numeric(27)
  gwas_weight[gwas_weight == "NC_049249.1"] <- as.numeric(28)
  gwas_weight[gwas_weight == "NC_049250.1"] <- as.numeric(29)
  gwas_weight[gwas_weight == "NC_049251.1"] <- as.numeric(30)
  gwas_weight[gwas_weight == "NC_049252.1"] <- as.numeric(31)
  gwas_weight[gwas_weight == "NC_049253.1"] <- as.numeric(32)
  gwas_weight[gwas_weight == "NC_049254.1"] <- as.numeric(33)
  gwas_weight[gwas_weight == "NC_049255.1"] <- as.numeric(34)
  gwas_weight[gwas_weight == "NC_049256.1"] <- as.numeric(35)
  gwas_weight[gwas_weight == "NC_049257.1"] <- as.numeric(36)
  gwas_weight[gwas_weight == "NC_049258.1"] <- as.numeric(37)
  gwas_weight[gwas_weight == "NC_049259.1"] <- as.numeric(38)
  gwas_weight[gwas_weight == "NC_049260.1"] <- as.numeric(39)
}

# Converts chromosome column to numeric value
gwas_manhattan <- gwas_weight %>% mutate_at(c('CHR'), as.numeric)

# Removes NA values
gwas_filtered <- na.omit(gwas_manhattan)

# Generates manhattan plot
manhattan_plot <- manhattan(gwas_filtered, chr = 'CHR', bp = "BP", snp = "SNP", p = "P")

View(manhattan_plot)
