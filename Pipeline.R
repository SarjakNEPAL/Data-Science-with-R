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


