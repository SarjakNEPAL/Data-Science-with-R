library(tidyverse)

# importing csv
demograph = read_csv("d.csv")
performance = read_csv("p.csv")
View(demograph)
View(performance)

# taking only required columns removing duplicate rows 
demograph_noDupe= demograph %>% 
  distinct() 
performance_noDupe= performance %>% 
  distinct() %>%  # removing duplicate data 
  select(Name, Gender, Math_Grade, English_Grade, Attendance_Rate)

# filtering the students
filteredPerformance =performance_noDupe%>%
  filter(Math_Grade < 50,na.rm = TRUE)
filteredPerformance

library(dplyr)
# joining demography on the filtered performance
withName= filteredPerformance %>% 
  left_join(demograph_noDupe, by = "Name")
withName

# Creating a Boxplot for Math Grades
ggplot(withName, aes(x = Gender, y = Math_Grade, fill = Gender)) +
  geom_boxplot() +
    labs(title = "Boxplot | Math grade vs gender",
       x = "Gender",
       y = "Math Grade")

# Outlier detection using IQR method
lower_quartile=quantile(withName$Math_Grade, 0.25, na.rm = TRUE)
upper_quartile=quantile(withName$Math_Grade, 0.75, na.rm = TRUE)
IQR = upper_quartile - lower_quartile

# Examining the relationship between socioeconomic status and math performance
avg_math_by_status <- withName %>%
  group_by(Socioeconomic_Status) %>%
  summarize(Average_Math_Grade = mean(Math_Grade, na.rm = TRUE))
avg_math_by_status

avg_math_by_age <- withName %>%
  group_by(Age) %>%
  summarize(Average_Math_Grade = mean(Math_Grade, na.rm = TRUE))
avg_math_by_age




# Identifying students who are outliers in Math grades
outliers = withName %>%
  filter(Math_Grade < (upper_quartile - 1.5 * IQR) | Math_Grade > (lower_quartile + 1.5 * IQR))
outliers


# Count outliers by Age Group
outlier_age_group = outliers %>%
  group_by(Age) %>%
  summarize(Count = n()) %>%
  arrange(desc(Count))

# Count outliers by Socioeconomic Status
outlier_socio_status = outliers %>%
  group_by(Socioeconomic_Status) %>%
  summarize(Count = n()) %>%
  arrange(desc(Count))

outlier_age_group 
outlier_socio_status 

