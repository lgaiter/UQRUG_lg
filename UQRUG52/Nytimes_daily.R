#install.packages("rvest")
library(rvest)
library(tidyverse)
#install.packages('miniUI')
#install.packages('shinyFiles')
#install.packages("cronR")
library(cronR)

NYT_page <- read_html("https://www.nytimes.com")
title_css <- NYT_page %>%
  html_elements(css = ".indicate-hover")

titles <- html_text(title_css)

titles <- data_frame(titles)
titles <- titles %>% 
  rename(.dots = setNames("titles", sprintf("`%s`", format(Sys.time(), format = "%d-%m-%Y %H:%M"))))

df <- read_csv("UQRUG52/NYT articles.csv")
df <- merge(df,titles,by=0, all.y=TRUE)
df <- select(df,-1)

write_csv(df,"UQRUG52/NYT articles.csv")
