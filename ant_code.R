
# Assignment # 1

################################################################################
# Exercise 1 ----
#
# Points: 1

## Instructions ----
#
# Write the command to load the package tidyverse

## Answer ----
library(tidyverse)


################################################################################
# Exercise 2 ----
#
# Points: 4

## Instructions ----
#
# The repository you have just cloned to a RStudio Project contains a CSV 
# data file (*data_ants.csv*) with the following variables:
# 
# - spp: number of ant species detected at a given sampling location
# - lat: the latitude of the sampling location in degrees N
# - alt: the altitude of the sampling location in metres
# 
# Write the command to read in the *ant_data.csv* data file using the *read_csv()* 
# function. The data must be assigned to a variable called *ants*.
#
# To simplify your code, make use of the pipe operator (i.e. %>%) to integrate
# the step of data transformation into the same chunk of commands that you will 
# write to read in the data. You will add the pipe operator after the read_csv()
# function to indicate that you want R to create two new variables in the 
# imported data set using the function mutate(): *zalt* and *zlat*. These 
# variables should be simply a standardized form of the variables alt and lat. 
# 
# Recall from the lecture: standardized variables are created by subtracting a 
# variable's mean from each individual value of the variable and dividing the 
# result by the variable's standard deviation. In R, the function to compute the 
# mean and standard deviation of a variable are called, respectively, mean() and 
# sd(). Check out their help files by writing and executing the commands ?mean 
# and ?sd in the *console* (one at a time).

## Answer ----
install.packages("tidyverse")

library(readr)
#install.packages("dplyr")
library(dplyr)

read_csv("ant_data.csv")

alt_mean <- mean(alt)

ants <- read_csv("ant_data.csv") %>% mutate(
  (zalt = (alt - mean(alt)) / sd(alt)),
  (zlat = (lat - mean(lat)) / sd(lat)))
summary(ants)
    
    #zalt = scale(alt, center = TRUE, scale = TRUE),
    #zlat = scale(lat, center = TRUE, scale = TRUE))


################################################################################
# Exercise 3 ----
#
# Points: 2

## Instructions ----

# Now that the data set has been imported and the new variables have been 
# created, use ggplot2 functions to make a scatter plot (i.e. point plot)
# of the variables *lat* and *alt*. In this case, it does not matter which 
# variable you choose to include on the x and y axes. Make sure you add an 
# informative title with the variable unit to each axis and use theme_bw() in 
# your plot.
# 
# Inspect the plot and note if there seems to be any relationship between 
# the altitude and latitude. If sampling was truly conducted randomly, you would
# expect altitude and latitude to have no obvious relationship with one another.

## Answer ----

library(ggplot2)

ant_plot <- ggplot(ants, aes(lat, alt)) + geom_point() + theme_bw() +
labs(x = "Latitude", y = "Altitude") + ggtitle("Ants high, low, north and south")

ant_plot



################################################################################
# Exercise 4 ----
#
# Points: 1

## Instructions ----

# Use ggplo2 functions to make the same scatter plot that you did in
# Exercise 3, but this time use the standardized altitude and latitude variables
# that you created in Exercise 2.
# 
# Once again, make sure you add an informative title with the variable unit to 
# each axis and use theme_bw() in your plot.
# 
# Inspect the plot and note that aside from the values on the x and y axes, the
# pattern shown by the points is the same as the one shown in the plot you 
# created in Exercise 3.

## Answer ----
ant_standard_plot <- ggplot(ants, aes(zlat, zalt)) + geom_point() + theme_bw() +
  labs(x = "Latitude", y = "Altitude") + ggtitle("Standardized Latitude and 
                                                 Altitude for Ants")
ant_standard_plot



################################################################################
# Exercise 5 ----
#
# Points: 2

## Instructions ----

# Commit this code (make sure to include a subject line and commit message
# according to the rules provided) and push it to GitHub. Follow the 
# instructions on the assignment repository's main page to notify your
# TA using an Issue. You must do this by *Thursday (February 3rd) at 
# 11:59pm*. Failure to do so by this interim deadline will result in your
# losing the two points that Exercise 5 is worth.

# After the TA adds the additional exercises, you will be notified 
# by GitHub via email. You will then have to pull (blue arrow pointing 
# down on the Git tab of RStudio) the changes (i.e. this R file with the
# new exercises) from GitHub to your RStudio Project to see and complete
# exercises 6-8. 

##exercise 6

ant_plot_alt_spp <- ggplot(ants, aes(alt, spp)) + geom_point() + theme_bw() +
  labs(x = "Altitude", y = "Species") + 
  ggtitle("Ants high, low, north and south") +
  geom_smooth()
ant_plot_alt_spp

## exercise 7

ant_plot_lat_spp <- ggplot(ants, aes(lat, spp)) + geom_point() + theme_bw() +
  labs(x = "Latitude", y = "Species") + 
  ggtitle("Ants high, low, north and south") +
  geom_smooth()
ant_plot_lat_spp





