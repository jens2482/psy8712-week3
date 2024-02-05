#Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Data Import and Cleaning
raw_df <- read.csv('../data/week3.csv', header = TRUE)
raw_df$timeStart <- as.POSIXct(raw_df$timeStart) 
raw_df$timeEnd <- as.POSIXct(raw_df$timeEnd)
clean_df <- raw_df[7:49,] #I couldn't figure out how to make it work with dates...
clean_df <- subset(clean_df, q6 == "1")

