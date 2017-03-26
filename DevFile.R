### Development File ###

library(devtools)
library(roxygen2)

setwd("~/Dropbox/Courses/Semester4/R/Midterm")

# DO NOT RUN THE FOLLOWING LINE
#### package.skeleton('easyRasch')
# Provided only for transparency

# Compile latest package and re-document
Current <- as.package('easyRasch')
load_all(Current)
document(Current)

# Create trial Rasch object
testRasch <- new('Rasch', 
                 name = 'Me', 
                 a = c(-3, -2, -1, 0, 1, 2, 3), 
                 y = c(1, 1, 1, 1, 0, 1, 0))
# try probability
probability(testRasch, 1)
# try probability with vector of thetas - !!! should trigger error !!!
probability(testRasch, 1:3)
# try likelihood
likelihood(testRasch, 2)
# try prior
prior(1)
# try prior with vector of thetas - !!! should trigger error !!!
prior(testRasch, 1:3)
# try eap
eap(testRasch)
# try plot
plot(testRasch)
