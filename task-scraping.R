library(tidyverse)
library(rvest)
library(stringr)
library(tidyr)
library(lubridate)

url="https://en.wikipedia.org/wiki/List_of_fastest-grossing_films"
page = read_html(url) 
page 

tbl= html_nodes(page, 'table') 
t = html_table(tbl)[[2]] # index no 1 ko table, first table of website
t
names(t) = c("Rank", "Date", "Global Release Date", "Title","Days to milestone","Gross on day of milestone")
t = as_tibble(t) 
t

pattern = ' \\d+$'

