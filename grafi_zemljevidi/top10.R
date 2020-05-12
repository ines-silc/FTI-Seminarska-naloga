library(knitr)
library(plyr)
library(dplyr)
library(readr)
library(rvest)
library(gsubfn)
library(ggplot2)
library(reshape2)
library(shiny)
library(XML)
library(tidyr)

uvozi_zasebne <- function(){
  data <- read_csv("zasebne_univerze.csv", na = c("NA", "", "..."))
  return(data)
}

zasebne <- uvozi_zasebne()
zasebne <- zasebne[,c(1, 3)]
colnames(zasebne) <- c("Institution", "Vrednosti")
urejen <- order(zasebne[,"Vrednosti"], decreasing = TRUE)
zasebne_urejene <- zasebne[urejen, , drop=FALSE]

top10 <- head(zasebne_urejene, 10)

top10$Institution <- factor(top10$Institution, levels = top10$Institution[order(top10$Vrednosti)])

graf_top10 <- ggplot(data=top10, aes(x=Institution, y=Vrednosti)) + 
  geom_bar(stat = 'identity', position = 'dodge',fill = "#ffcc80") + coord_flip() + labs(title ="Univerze z največjimi fundacijami") +
  ylab("Fundacije (v bilijon $)") + xlab("Institucija") + theme(plot.title = element_text(hjust = 0.5))


print(graf_top10)


