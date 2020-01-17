install.packages('ggplot2')
install.packages('ggplot2movies')

library(ggplot2)
library(ggplot2movies)

# Data & Aesthetics
pl <- ggplot(movies, aes(x = rating))

# Geometry
# pl2 <- pl + geom_histogram(binwidth = 0.1, color = 'red', fill = 'pink', alpha = 0.7)
pl2 <- pl + geom_histogram(bindwidth = 0.1, aes(fill = ..count..))
pl3 <- pl2 + xlab('Movie Ratings') + ylab('Count')
pl3 + ggtitle("My Plot")

df <- mtcars
pl <- ggplot(df, aes(x = wt, y = mpg))
# pl + geom_point(alpha = 0.5, size = 5)
# pl + geom_point(aes(size = factor(cyl)))
# pl2 <- pl + geom_point(aes(shape = factor(cyl), color = factor(cyl)), size = 5)
pl2 <- pl + geom_point(aes(shape = factor(cyl), size = 5))
# pl3 <- pl2 + scale_color_gradient(low = 'blue', high = 'red') NOT CONTIONOUS

df <- mpg
pl <- ggplot(df, aes(x = class))
pl + geom_bar(aes(fill = drv), position = "dodge")

pl <- ggplot(movies, aes(x = year, y = rating))
pl <- pl + geom_bin2d()
pl + scale_fill_gradient(high = 'red', low = 'green')

pl <- ggplot(mpg, aes(x = displ, y = hwy)) + geom_point()
# pl <- pl + coord_cartesian(xlim = c(1, 4), ylim = c(15, 30))
# pl <- pl + coord_fixed(ratio = 1 / 3)
pl + facet_grid(. ~ cyl)
pl + facet_grid(drv ~ .)
pl + facet_grid(drv ~ cyl)

head(mpg)
pl <- ggplot(mpg, aes(x = hwy))
pl + geom_histogram(fill = 'pink', alpha = 0.7)

pl <- ggplot(mpg, aes(x = manufacturer))
pl + geom_bar(aes(fill = factor(cyl)))

head(txhousing)
pl <- ggplot(txhousing, aes(x = sales, y = volume))
pl + geom_point(color = 'blue') + geom_smooth(color = 'red')
