# Workflow basics
object_name <- "value" #object name get value
## short cut for assignment operator - Alt + the minus sign (-)
## naming convention
### separate the name using the _ e.g. snake_case

this_is_a_really <-  2.5

## RStudio completion facility:
# type the 'object' or 'function' name then hit tab key
seq

# floating tooltip reminds one of function's arguments and purpose 
# press the F1 button why trying to auto complete a function to get the help tip.
seq()
#calling a function
# while writing a function hit the tab button to automatically add the parentheses

# differene between parentheses and braces
y <- seq(1, 10, length.out = 6)
y

filter(mpg, cyl == 8)
filter(diamonds, carat > 3)


#text having all the shortcuts - Alt + shift + k