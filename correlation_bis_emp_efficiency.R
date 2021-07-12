

# install.packages("RPostgreSQL")
require("RPostgreSQL")

# create a connection
# save the password that we can "hide" it as best as we can by collapsing it
pw <- {
  "loader@123"
}

# loads the PostgreSQL driver
drv <- dbDriver("PostgreSQL")
# creates a connection to the postgres database
# note that "con" will be used later in each connection to the database
con <- dbConnect(drv, dbname = "bismanak_020721",
                 host = "localhost", port = 5444,
                 user = "enterprisedb", password = pw)
rm(pw) # removes the password

# check for the cartable
dbExistsTable(con, "dashboard.data_manak_eff_index_emp")
# TRUE
df_postgres <- dbGetQuery(con, "select dense_rank() over( order  by str_is_number ) as is_number_id,str_is_number,time_taken_lg,num_entry_emp_id,data_id from  eff_index.data_manak_basic_emp where  batch_id=(select max(batch_id) from  eff_index.data_manak_basic_emp )
and time_taken_lg is not null and str_procedure_name='Normal' ")
# emp data


summary(df_postgres)
mode(df_postgres$str_is_number)
#remove(df_postgres) 

barplot(df_postgres[1,3])

head(df_postgres, n = 10)
#end


#install.packages("ggplot2")
#install.packages("dplyr")
#install.packages("plyr")
#install.packages("broom")
#install.packages("ggpubr")

library("ggplot2")
library("dplyr")
library("broom")
library("ggpubr")
summary(df_postgres)

hist<- as.numeric(df_postgres$within_time)
hist<- as.numeric(df_postgres$time_taken_lg)

#check normality of data
hist(df_postgres$time_taken_lg,freq =10,xlim=range(50))
dplyr::sample_n(df_postgres,10)

junk$nm[junk$nm %in% "B"] <- "b"

x <- df_postgres$time_taken_lg
y <- df_postgres$time_taken_lg[df_postgres$time_taken_lg =="NA"]<- "0"

library(plyr)
t <- revalue(df_postgres$time_taken_lg, c("null"="0"))
x<- df_postgres$time_taken_lg
y<- df_postgres$is_number_id
y<-df_postgres$num_entry_emp_id
y



# fin sd and mean of time taken in lg

sd(x)
mean(x)
# show the valu in graph
x <- ggplot(df_postgres, aes(x=time_taken_lg, y=is_number_id))+geom_bar(stat='identity')
x #displays the plot

# claculate corelation cofficient 

cor(df_postgres$time_taken_lg,df_postgres$is_number_id)

cor(df_postgres$time_taken_lg,df_postgres$num_entry_emp_id)


# Plot with main and axis titles
# Change point shape (pch = 19) and remove frame.
plot(x, y, main = "Main title",
     xlab = "time taken in GoL", ylab = "IS number",
     pch = 19, frame = FALSE)
# Add regression line
plot(x, y, main = "Time in GoL wrt IS number",
     xlab = "time taken in GoL", ylab = "Is Number",
     pch = 19, frame = FALSE)
abline(lm(y ~ x, data = df_postgres), col = "blue")


# advance correlation 

library(corrplot)
corrplot.mixed(cor(df_postgres[,3]), order="hclust", tl.col="black", tl.pos="lt")

lm(df_postgres$time_taken_lg~df_postgres$is_number_id, data=df_postgres)
summary(lm(df_postgres$time_taken_lg~df_postgres$is_number_id, data=df_postgres))

max(df_postgres$time_taken_lg)

plot(df_postgres$time_taken_lg, jitter(df_postgres$is_number_id), pch=16,
     main="Relationship of time taken in GoL and Is number",
     xlab="time taken GoL",
     ylab="Is number",
     ylim=c(0, 60),
     xlim=c(0,145))


