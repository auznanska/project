movie = read.csv("C:/Users/Amelia/Desktop/movies.csv", header = TRUE)
View(movie)

rating = read.csv("C:/Users/Amelia/Desktop/rating1.csv", header = T)
View(rating)

merged_data <- merge(movie, rating, by = "movieId")
View(merged_data)

head(merged_data)

mydata_merged <- merged_data[2:5]
View(mydata_merged)

df <- data.frame(USER_ID = mydata_merged$userId,
                 TITLE = mydata_merged$title, 
                 RATING = mydata_merged$rating,
                 GENRE = mydata_merged$genres)
View(df)

install.packages("qdap")
library("qdap")

mydata <- within(df, 
                 GENRE<-data.frame(
                   do.call('rbind', unique(strsplit(as.character(GENRE))), '|', fixed = TRUE)))

mydata$GENRE <- which(duplicated(mydata$GENRE))

View(mydata)                    
       
