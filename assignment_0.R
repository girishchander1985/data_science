fruits.data<-data.frame(vec1=c(1,2,3),vec2=c("Apple","Orange","Guava"),vec3=c(180,100,50))


fruits.data

fruits.data[2,3]
fruits.data[2:3,3]

fruits.data =rbind(data.frame(vec1=4,vec2="Grapes",vec3=120),fruits.data)

fruits.data =cbind(fruits.data ,data.frame(vec4 = c(10,20,30,40)))

