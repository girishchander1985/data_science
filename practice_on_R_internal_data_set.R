data()

# Loading
data(mtcars)
# Print the first 6 rows
head(mtcars, 6)

# 1. Loading 
data("mtcars")
# 2. Print
head(mtcars)

# Number of rows (observations)
nrow(mtcars)

# Number of columns (variables)
ncol(mtcars)

x <- mtcars$wt
y <- mtcars$mpg
# Plot with main and axis titles
# Change point shape (pch = 19) and remove frame.
plot(x, y, main = "Main title",
     xlab = "X axis title", ylab = "Y axis title",
     pch = 19, frame = FALSE)
# Add regression line
plot(x, y, main = "Main title",
     xlab = "X axis title", ylab = "Y axis title",
     pch = 19, frame = FALSE)
abline(lm(y ~ x, data = mtcars), col = "blue")

# Add labels
scatterplot(wt ~ mpg, data = mtcars,
            smoother = FALSE, grid = FALSE, frame = FALSE,
            labels = rownames(mtcars), id.n = nrow(mtcars),
            id.cex = 0.7, id.col = "steelblue",
            ellipse = TRUE)


swiss <- read.csv("https://raw.githubusercontent.com/ejvanholm/DataProjects/master/swiss.csv")

swiss
library(corrplot)
corrplot.mixed(cor(swiss), order="hclust", tl.col="black", tl.pos="lt")