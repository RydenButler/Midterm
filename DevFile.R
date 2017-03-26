### Development File ###

library(devtools)
library(roxygen2)

setwd("~/Dropbox/Courses/Semester4/R/Midterm")

# DO NOT RUN THE FOLLOWING LINE
#### package.skeleton('easyRasch')
# Provided only for transparency

Current <- as.package('easyRasch')
load_all(Current)
document(Current)


testRasch <- new('Rasch', name = 'Me', a = rep(0, 10), y = sample(c(0,1), 10, T))
probability(testRasch, rep(1,10))
