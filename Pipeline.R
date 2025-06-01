#pipeline

#ctrl + shift + m

library(tidyverse) 
install.packages("gapminder")    
# run only once 
library(gapminder) 
names(gapminder) 
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + 
  geom_point(aes(colour=continent)) +scale_x_log10()
options(scipen=1000) # scientific from to normal format ma change garcha

# Intermediate variables 
A = filter(gapminder, continent=="Europe", year==2007) 
B = select(A,-continent,-year) 
ggplot(B,aes(x=gdpPercap,y=lifeExp, size=pop)) + 
  geom_point(alpha=0.5) # NORMALLY SCATTER PLOT BUT SIZE LE VARIATE BHAKO CHA SO BUBBLE PLOT  
# alpha rakhyo bhane transparency aaucha golo golo ma narakhyo bhane default =1 

# Nested function calls 
ggplot(select(filter(gapminder, continent=="Europe", year==2007), 
              -continent,-year),aes(x=gdpPercap,y=lifeExp, size=pop)) + 
  geom_point(alpha=0.5) 


# pipes

#X %>%

gapminder %>%
  filter(continent=="Europe", year==2007)%>%
  select(-continent,-year)%>%
  ggplot(aes(x=gdpPercap,y=lifeExp, size=pop)) + 
  geom_point(alpha=0.5) 
#alt shift k= shortcuts


gapminder %>% 
  filter(year==1952) %>% 
  summarise(num_countries=n_distinct(country), 
            mean_pop=mean(pop))
  
gapminder %>% 
  group_by(year) %>% 
  summarise(num_countries=n_distinct(country), 
            mean_pop=mean(pop)) 

summary(gapminder)

gapminder %>% 
  group_by(year) %>% 
  summarise(num_countries=n_distinct(country), 
            mean_pop=mean(pop)) %>% 
  ggplot(aes(x=year,y=mean_pop)) + 
  geom_line()
View(starwars)
ncol(starwars) 
nrow(starwars)


starwars %>% 
  filter(species=="Droid") %>% 
  arrange(desc(mass))

myleague = "E0"

# Get data from www.football-data.co.uk

url = paste0("https://www.football-data.co.uk/example.csv")  

football = read_csv(url)

View(football)
distinct(football,HomeTeam)


football %>% 
  filter(HomeTeam=="Arsenal" | AwayTeam=="Arsenal") 
football %>% 
  group_by(HomeTeam) %>% 
  summarize(mean_Goals=mean(`Full time home goals`))
  
  