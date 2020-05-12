#setwd("C:/FAKS/3. letnik/FTI/Seminarska-naloga/FTI-Seminarska-naloga/grafi,zemljevidi")

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
zasebne <- zasebne[,c(2, 3)]
colnames(zasebne) <- c("state", "2019")
zasebne <- zasebne %>% group_by(state) %>% summarise(`2019` = sum(`2019`))

uvozi_javne <- function(){
  data <- read_csv("javne_univerze.csv", na = c("NA", "", "..."))
  return(data)
}

javne <- uvozi_javne()
javne <- javne[,c(2, 3)]
colnames(javne) <- c("state", "2019")
javne <- javne %>% group_by(state) %>% summarise(`2019` = sum(`2019`))

write.csv(zasebne,"zasebne.csv", row.names = FALSE)
write.csv(javne,"javne.csv", row.names = FALSE)
