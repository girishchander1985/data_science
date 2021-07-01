fruits.data<-data.frame(vec1=c(1,2,3),vec2=c("Apple","Orange","Guava"),vec3=c(180,100,50))


fruits.data

fruits.data[2,3]
fruits.data[2:3,3]

fruits.data =rbind(data.frame(vec1=4,vec2="Grapes",vec3=120),fruits.data)
fruits =rbind(fruits, data.frame(vec1= 4, vec2="Grapes", vec3="120"))

fruits.data =cbind(fruits.data ,data.frame(vec4 = c(10,20,30,40)))



mylist<-list(vec1 = c(6,7,8),vec2 =c("Football","Basketball","Volleyball"),vec3 = c("300", "400", "600"))
mylist
mylist[[2]][2] = "Carrom"

A =matrix(c(13:22), nrow = 3, ncol = 3, byrow = T)
A = matrix(c(13:21), nrow = 3, ncol = 3, byrow = F)

A

A[,3]

A[1,1]