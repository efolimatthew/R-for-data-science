## Exercise
# Run ggplot(data = mpg)
library(tidyverse)
ggplot(data = mpg)
# How many rows are in mtcars? 
nrow(mtcars)
# how many columns?
ncol(mtcars)
#what does the 'drv' variable describe? Read the help for ?mpg to find out.
?mpg #'drv' - shows the type of drive train, where f = front-wheel drive, r = rear wheel drive, 4 = 4wd
# make a scatterplot of hwy versus cyl
ggplot(data = mpg, aes(x = hwy, y = cyl)) + geom_point()

#what happens if you make a scatterplot of class versus drv? 
ggplot(data = mpg, aes(x = class, y = drv)) + geom_point()
# why is the plot not useful? The plt is not useful because both variables are categorical. 

## Exercises_two
# what is gone wrong with this code? 
ggplot(data = mpg) + 
  geom_point(
    mapping = aes(x = displ, y =hwy, colour = "blue")
  )
# why are the points not blue? The points are not blue because the color aesthetics is mapped in the 'aes()'

#Which variables in mpg are categorical? which variables are continuous?
?mpg
str(mpg)
# categorical variables- manufacturer, model, cyl, trans, drv, fl, class.
# continuous variable - displ, cty, hwy, year

# Map a continuous variable to colour, size, and shape

ggplot(data = mpg) + 
  geom_point(
    mapping = aes(x = displ, y =hwy, colour = displ)
)

ggplot(data = mpg) + 
  geom_point(
    mapping = aes(x = displ, y =hwy, size = cty)
  )
ggplot(data = mpg) + 
  geom_point(
    mapping = aes(x = displ, y =hwy, shape = hwy) # An error occurred; continuous variable cannot be mapped to shape.
  )

ggplot(data = mpg) + 
  geom_point(
    mapping = aes(x = displ, y =hwy, colour = displ, size = cty, shape = hwy)
  )
#mapped a categorical variable to shape = fl to see how it will display.
ggplot(data = mpg) + 
  geom_point(
    mapping = aes(x = displ, y =hwy, colour = displ, size = cty, shape = fl)
  )

#What happens if you map the same variable to multiple aesthetics?
ggplot(data = mpg) + 
  geom_point(
    mapping = aes(x = displ, y =hwy, colour = fl, size = fl, shape = fl)
  )
# Depending on the type of variable. if it is compatible with the acceptable defunct type for that aesthetics  of the 
#An error occurred: using size for a discrete variable is not advisable.

## what is discrete, continuous and categorical variables?

ggplot(data = mpg) + 
  geom_point(
    mapping = aes(x = displ, y =hwy, stroke = cty)
  )
?geom_point
# stroke aesthetics -  modifies the width of the
# border

# What happens if you map an aesthetic to something other than a variable name like aes(color = displ < 5)?
ggplot(data = mpg) + 
  geom_point(
    mapping = aes(x = displ, y =hwy, color = displ < 5)
  ) # All displ variable with values above 5 were coloured


## Facets
## Variables passed into the facet_wrap() should be discrete.
### facet by single variable use facet_wrap( ~ )
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)

## facet in a combination of two variables
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)


## facet not using a rows or columns dimensions.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

# Exercises
# what happens if you facet on a continuous variable?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ displ, nrow = 2) # the output treats the values as factors.


#2 what do the empty cells in a plot with facet_grid(drv ~ cyl) mean? 
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)
# How do they relate to this plot
ggplot(data = mpg) +
  geom_point(mapping = aes(x = drv, y = cyl)) 


#3. What plot does the following code make? What does . do?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

#4. Take the first faceted plot in this section:
#What are the advantages to using faceting instead of the colour aesthetic?
#what are the disadvantages?
#How might the balance change if you had a larger dataset?

#5. Read ?facet_wrap. What does nrow do? what does ncol do? 
# What other options control the layout of the individual panels?
# why doesn't facet_grid() have nrow and ncol variables?

#6. When using facet_grid() you should usually put the variable with more unique level in the columns. why?
