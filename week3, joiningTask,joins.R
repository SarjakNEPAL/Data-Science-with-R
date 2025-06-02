library(nycflights13)
data(package="nycflights13") # kun kun data cha in datasets herne
library(tidyverse)
View(airlines)
View(flights)
library(dplyr)

delayed_flights = flights %>%       
  # start with the flights 
  filter(dep_delay>0) %>%           
  # find only the delays 
  group_by(carrier) %>%             
  # group by airline (carrier) 
  summarise(num_delay=n())          
# count the observations 
delayed_flights

View(airports)

left_join(delayed_flights,airlines,by="carrier")


flights %>%                             # start with the flights 
  filter(dep_delay>0) %>%               # find only the delays 
  group_by(carrier) %>%                 # group by airline (carrier) 
  summarise(num_delay=n()) %>%          # count the observations 
  left_join(airlines,by="carrier") %>%  # join by common key 
  filter(num_delay==max(num_delay)) # select the airline

#finding arrival delay in avg

flights %>% 
  group_by(dest) %>% 
  summarise(mean_delay=mean(arr_delay,na.rm=TRUE)) %>% # N/A lai rm gareko
  filter(mean_delay==min(mean_delay,na.rm = TRUE)) %>% 
  left_join(airports,by=c("dest"="faa")) %>% 
  select(name)




############################################################
#task 1 
flights %>% 
  filter(origin=="JFK"&dest=="SEA") %>%
  summarise(Flight=carrier,average_airtime=mean(air_time,na.rm=TRUE),minimum_airtime=min(air_time,na.rm=TRUE),maximum_airtime=max(air_time,na.rm=TRUE)) %>% 
  left_join(airlines,by=c("Flight"="carrier"))


flights %>% 
  mutate(speed_mph=distance/(air_time/60)) %>% 
  group_by(dest) %>% 
  summarise(avg_speed=mean(speed_mph,na.rm=TRUE)) %>% 
  top_n(1,avg_speed)%>% 
  left_join(airports,by=c("dest"="faa")) %>% 
  select(dest,name,avg_speed,tzone)


############################################################
View(diamonds)
summary(diamonds)
dim(diamonds)

diamonds %>% 
  group_by(cut) %>% 
  summarise( n= n(),
             correlation=cor(carat,price)) 



diamonds %>% 
  group_by(color) %>% 
  summarise(avg_price=mean(price/carat)) %>% 
  filter(avg_price==max(avg_price)) %>% 
  select(color)

