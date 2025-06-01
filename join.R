library(tidyverse)
data1 <- data.frame(ID = 1:2,                      # Create first example data frame
                    X1 = c("a1", "a2"),
                    stringsAsFactors = FALSE)
data2 <- data.frame(ID = 2:3,                      # Create second example data frame
                    X2 = c("b1", "b2"),
                    stringsAsFactors = FALSE)

data2
data1


#join concepts without usinf dplyr or tidyverse package 
#merge(x , y, by.x,by.y,all.x,all.y)
#where x,y  = Data frames to be merged
#by = Common column(s) names to match 
#by.x and by.y specifies different column name if the key is differ
#all : logical if TRUE, performs


# inner join (Default join)

merge(data1,data2,by="ID")

#left join 

merge(data1,data2,by="ID",all.data1= TRUE)

# outer join
merge(data1,data2,by="ID",all=TRUE)


library(dbplyr)
library(tidyverse)
inner_join(data1,data2,by="ID")
left_join(data1,data2,by="ID")
full_join(data1,data2,by="ID")
semi_join(data1,data2,by="ID") # common kun cha 2ta table ma thapauna / check whether can be joined or not / shows thw left
anti_join(data1,data2,by="ID") #uncommin data dekhau cha but only left patti ko matra dekhaucha right side ko kei dekhaunna


