#extracting rows 
library(tidyverse)
library(nycflights13)
view(flights)
dim(flights)

mutate(flights,gain=arr_delay-dep_delay,speed=distance/(air_time/60)) # adds columns on output
flights=mutate(flights,gain=arr_delay-dep_delay,speed=distance/(air_time/60))

transmute(flights, gain=arr_delay-dep_delay, gain_per_hour=gain /(air_time/60)) 
transmute(flights, distance_residual=distance-mean(distance)) #makes new dataset of added column

#### extracting ##################
slice(flights, 87:96)   # particular 10 rows 
top_n(flights, 20) 


head(flights,20)
top_n(flights,20)
filter(flights, month==1, day==1)
filter(flights, month==11, day==5)

#sample destribution in R
set.seed(123)
sample_n(flights,20)
0.001*nrow(flights)
arrange(flights,year,month,day)
arrange(flights,desc(dep_time))


#exercise

# departed between midnight and 6 am inclusive.

datas=filter(flights,dep_time==2400 | dep_time <= 600)
head(datas)

# arrival delay of 2 or more hours

filter(filter,arr_delay>=120)

#flew to heustom IAH or HOU
filerHeouston= filter(flights,dest=='IAH' | dest=='How')

#operated bt United(UA),aa,dl

xyz= filter(flights, carier=='UA'| carierr=='AA'|carier=='dl')
            
z=filter(flights,arr_delay>120,dep_delay<=0)
View(z)


a= filter(flights,dep_delay >= 60, dep_delay-arr_delay>30)
view(a)




# find all the flights that had 
#a) had a departure delay of more than 1 hour
#B) left on time
#c) arrived early
#d) had both departures and arrival delays > 30 minutes


a=filter(flights, dep_delay>=60)
b=filter(flights, dep_delay==0)
c=filter(flights, arr_delay<0)
d=filter(flights, dep_delay>30 & arr_delay>30)
View(a)
View(b)
View(c)
View(d)


#create a new column gain (dep delay- arr delay) then 
#filter all the flights with positive gain
#filter all the flights with -ve gain 
#find the top 10 flights that gained the most time in air -----topn

data= mutate(flights, gain=dep_delay-arr_delay)
View(data)

posFlt= filter(data,gain>0)
negGain=filter(data,gain<0)
top10= top_n(data,10,wt=gain)

View(posFlt)


# find the flight that flied on summer months- june july aug sep
summer= filter(data, month>=6 & month<=9)
View(summer)
