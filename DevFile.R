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