#Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Data Import and Cleaning
raw_df <- read.csv('../data/week3.csv', header = TRUE)
raw_df$timeStart <- as.POSIXct(raw_df$timeStart)
raw_df$timeEnd <- as.POSIXct(raw_df$timeEnd)
clean_df <- raw_df[7:49,] #I couldn't figure out how to make it work with dates...
clean_df <- subset(clean_df, q6 == "1")

#Analysis
clean_df$timeSpent <- (difftime(clean_df$timeEnd, clean_df$timeStart, units = "secs"))
hist(clean_df$timeSpent <- as.numeric(clean_df$timeSpent)) #is there another way to get rid of the "secs" label?
frequency_tables_list <- lapply(clean_df[, 5:14], table)
lapply(frequency_tables_list, barplot)
sum(clean_df$q1 >= clean_df$q2 & clean_df$q2 != clean_df$q3) #is this using coercion?
for(freq in frequency_tables_list){
  barplot(freq)}