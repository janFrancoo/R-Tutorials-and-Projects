install.packages('dplyr')
install.packages('nycflights13')

library('dplyr')
library('nycflights13')

head(flights)
head(filter(flights, month == 11, day == 12))
slice(flights, 1:10)
head(arrange(flights, desc(month), desc(day), desc(arr_time)))
head(select(flights, carrier, arr_time))
head(rename(flights, airline_carrier = carrier))
distinct(select(flights, carrier))
head(mutate(flights, new_col = arr_delay - dep_delay))
summarise(flights, avg_air_time=mean(air_time, na.rm = TRUE))
sample_n(flights, 10)
sample_frac(flights, 0.1)

df <- mtcars
result <- arrange(sample_n(filter(df, mpg > 20), 5), desc(mpg))
result

result <- df %>% filter(mpg > 20) %>% sample_n(5) %>% arrange(desc(mpg))
result

df <- mtcars
head(mtcars)
head(filter(mtcars, mpg > 20, cyl == 6))
head(arrange(mtcars, cyl, desc(wt)))
head(select(mtcars, mpg, hp))
distinct(mtcars, gear)
head(mutate(mtcars, Performance = hp / wt))
summarise(mtcars, avg_mpg = mean(mpg))
df %>% filter(cyl == 6) %>% summarise(avg_hp = mean(hp))
