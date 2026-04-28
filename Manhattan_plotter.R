library(qqman)
library(dplyr)

manhattan(gwas_filtered, chr = 'CHR', bp = "BP", snp = "SNP", p = "P")

{
  gwas_nplates[gwas_nplates == "chrI"] <- as.numeric(1)
  gwas_nplates[gwas_nplates == "chrII"] <- as.numeric(2)
  gwas_nplates[gwas_nplates == "chrIII"] <- as.numeric(3)
  gwas_nplates[gwas_nplates == "chrIV"] <- as.numeric(4)
  gwas_nplates[gwas_nplates == "chrV"] <- as.numeric(5)
  gwas_nplates[gwas_nplates == "chrVI"] <- as.numeric(6)
  gwas_nplates[gwas_nplates == "chrVII"] <- as.numeric(7)
  gwas_nplates[gwas_nplates == "chrVIII"] <- as.numeric(8)
  gwas_nplates[gwas_nplates == "chrIX"] <- as.numeric(9)
  gwas_nplates[gwas_nplates == "chrX"] <- as.numeric(10)
  gwas_nplates[gwas_nplates == "chrXI"] <- as.numeric(11)
  gwas_nplates[gwas_nplates == "chrXII"] <- as.numeric(12)
  gwas_nplates[gwas_nplates == "chrXIII"] <- as.numeric(13)
  gwas_nplates[gwas_nplates == "chrXIV"] <- as.numeric(14)
  gwas_nplates[gwas_nplates == "chrXV"] <- as.numeric(15)
  gwas_nplates[gwas_nplates == "chrXVI"] <- as.numeric(16)
  gwas_nplates[gwas_nplates == "chrXVII"] <- as.numeric(17)
  gwas_nplates[gwas_nplates == "chrXVIII"] <- as.numeric(18)
  gwas_nplates[gwas_nplates == "chrXIX"] <- as.numeric(19)
  gwas_nplates[gwas_nplates == "chrXX"] <- as.numeric(20)
  gwas_nplates[gwas_nplates == "chrXXI"] <- as.numeric(21)
  gwas_nplates[gwas_nplates == "chrUn"] <- as.numeric(22)
}

gwas_manhattan <- gwas_nplates %>% mutate_at(c('CHR'), as.numeric)

gwas_filtered <- na.omit(gwas_manhattan)

manhattan(gwas_filtered, chr = 'CHR', bp = "BP", snp = "SNP", p = "P")
