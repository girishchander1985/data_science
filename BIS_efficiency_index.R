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
dbExistsTable(con, "data_manak_eff_index_emp")
# TRUE
df_postgres <- dbGetQuery(con, " select * from  dashboard.data_manak_eff_index_emp where batch_id=(select max(batch_id) from dashboard.data_manak_eff_index_emp) ")
# emp data

df_postgres 

barplot(df_postgres[1,12])

head(df_postgres, n = 10)
#end



wim5 <-dbGetQuery(con,"select * from  dashboard.data_manak_eff_index where batch_id=(select max(batch_id) from dashboard.data_manak_eff_index ) order by eff_index  desc" )

head(wim5, n = 10)

as.matrix(wim5[,9:10])

barplot (as.matrix(wim5[,10]),xlab = "Branch Name",ylab = "Efficiency index", names.arg=wim5$str_branch_name,col=c("blue","red") )


barplot (wim5[,10],xlab = "Branch Name",
         ylab = "Efficiency index", names.arg=wim5$str_branch_name,col='blue') 

barplot (wim5[,10],xlab = "Branch Name",
         ylab = "Efficiency index", names.arg=wim5$str_branch_name,horiz=TRUE,col='blue') 




