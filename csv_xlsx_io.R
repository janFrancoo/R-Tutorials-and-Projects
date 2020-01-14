df <- mtcars
write.csv(df, 'saved_df.csv')
df.new <- read.csv('saved_df.csv')

install.packages('readxl')
library(readxl)
excel_sheets('Sample-Sales-Data.xlsx')
df <- read_excel('Sample-Sales-Data.xlsx', sheet = "Sheet1")
head(df)

install.packages('xlsx')
library('xlsx')

write.xlsx(mtcars, "out_mtcars.xlsx")
