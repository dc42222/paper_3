rm(list = ls())
install.packages("ggplot2")
library(ggplot2)


File1 <- read.csv("File2.txt", header = TRUE, sep = "\t")
File2 <- read.csv("File3.txt", header = TRUE, sep = "\t")

head(File1)
head(File2)


merged_file <- merge(File2, File1, by = "Sample")

head(File1)
head(File2)
head(merged_file)


any(merged_file$QC.pass == "False")

cleaned <- merged_file[merged_file$QC.pass == "True", ]


cleaned$Population <- factor(
  cleaned$Population,
  levels = c("SAM", "WAF", "EAF", "CAF", "SAS", "WSEA", "ESEA", "OCE")
)



boxplot(Fws ~ Population, cleaned, outline = FALSE, col = c("green", "red","orange","yellow","purple","lightblue","blue","pink"), ylim = c(0.0, 1))


?factor
