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


testRasch <- new('Rasch', 
                 name = 'Me', 
                 a = rep(0, 10), 
                 y = c(rep(0,5), rep(1,5)))
probability(testRasch, 1)
probability(testRasch, 1:3)
likelihood(testRasch, 1)
prior(1)
eap(testRasch, -6, 6)
