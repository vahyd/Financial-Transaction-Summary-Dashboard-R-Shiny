if("shiny" %in% rownames(installed.packages()) == FALSE) {install.packages("shiny")}
#if("rNVD3" %in% rownames(installed.packages()) == FALSE) {install.packages("rNVD3")}
if("doBy" %in% rownames(installed.packages()) == FALSE) {install.packages("doBy")}
if("devtools" %in% rownames(installed.packages()) == FALSE) {install.packages("devtools")}
if("lubridate" %in% rownames(installed.packages()) == FALSE) {install.packages("lubridate")}
if("rCharts" %in% rownames(installed.packages()) == FALSE) {require(devtools)
  install_github('rCharts', 'ramnathv')}

library(lubridate)

library(shiny)

library(rCharts)
#require(rNVD3)

require(devtools)
library(doBy)


#df  <- read.csv(file.choose())
myfile <- file.path("data", "data.csv") 
df <- read.csv(myfile, header=T, sep=",")


#df <- read.csv("F:\\Dashboard\\data.csv", header=T, sep=",")


df$DateStart <- as.Date(df$DateStart , "%m/%d/%y")
df$month <- month.abb[month(df$DateStart)]


