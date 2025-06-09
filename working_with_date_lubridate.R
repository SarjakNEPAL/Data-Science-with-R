library(lubridate)
wday(today(),label = TRUE)
dmy(01032020)
dmy(01032020) - dmy(28022020)
#Tyson Fury (born 12/08/1988) and Deontay Wilder (born 22/10/1985)
#boxed for the WBC Heavyweight title.  Use lubridate to calculate
#how many days older Wilder is than Fury

dmy("12/08/1988")-dmy("22/10/1985")
