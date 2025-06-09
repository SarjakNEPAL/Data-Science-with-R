#data scrapping

#web bata data kasari line

#web crawling -> getting data realtime, by realtime processing, craul unstructure data, key value pairs, 



#web scraping
library(tidyverse) 
library(rvest) # used for web scrapping. It is used to read and parse HTML from web pages
library(stringr) # is the package for string manipulation. It provides consistent functions for pattern matching and regular expression REGEX
library(tidyr) # reshapes and cleans the data. It helps you to move columns into rows,it can either be separate or combined columns 
library(lubridate) # it is the packaged for working with dates and times. It makes it easy to convert strings to dates,
# calculate the differences between dates and extract the date patterns such as week, days, leapyears, etc

url = "http://espn.go.com/nfl/superbowl/history/winners" 
page = read_html(url) 
page 

sb_table = html_nodes(page, 'table') 
sb = html_table(sb_table)[[1]] # index no 1 ko table, first table of website
sb
sb = sb[c(-1,-2),] 
names(sb) = c("number", "date", "site", "result") 
sb = as_tibble(sb) 
sb

mutate(sb,number=1,nrow(sb))
mutate(sb,darw=mdy(date))

pattern = ' \\d+$' 
separate(sb,result,c("winner","loser"),sep=', ') %>% 
  mutate(winnerscore=as.numeric(str_extract(winner,pattern))) %>% 
  mutate(winner=gsub(pattern,"",winner)) # space hataideu bhanya

library(ggplot2)


# Pipe 
pattern = ' \\d+$' 
sb %>%
mutate(number=1:nrow(sb)) %>% 
  mutate(date=mdy(date)) %>% 
  separate(site,c("stadium","city",NA),sep='[()]') %>% 
  separate(result,c("winner","loser"),sep=', ') %>% 
  mutate(winnerscore=as.numeric(str_extract(winner,pattern))) %>% 
  mutate(winner=gsub(pattern,"",winner)) %>% 
  mutate(loserscore=as.numeric(str_extract(loser,pattern))) %>% 
  mutate(loser=gsub(pattern,"",loser)) %>% 
  mutate(margin_of_win=winnerscore-loserscore) %>% 
  ggplot(data, aes(x = (date), y =margin_of_win)) +
  geom_point()+labs(x="date",y="margin")






