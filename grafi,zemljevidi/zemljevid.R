setwd("C:/FAKS/3. letnik/FTI/Seminarska-naloga/FTI-Seminarska-naloga/grafi,zemljevidi")

library(readr)

sl <- locale("sl", decimal_mark=".", grouping_mark=",")

uvozi.zasebne <- function() 
  data <- {read.csv2("zasebne_univerze.csv", na="..", 
                     locale=locale(grouping_mark=","), skip=5)
    }




zasebne <- uvozi.zasebne()
zasebne