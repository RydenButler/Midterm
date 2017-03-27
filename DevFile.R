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

# Create Rasch object
testRasch <- new('Rasch', 
                 name = 'Me', 
                 a = c(-3, -2, -1, 0, 1, 2, 3), 
                 y = c(1, 1, 1, 1, 0, 1, 0))
# Check validation of uneven slot lengths - !!! should trigger error !!!
badRasch <- new('Rasch',
                name = 'Me',
                a = 0,
                y = c(0,1))
# Check validation of non-binary y slot - !!! should trigger error !!!
badRasch <- new('Rasch',
                name = 'Me',
                a = c(0, 0, 0),
                y = c(0, 1, 2))
# Check validation of non-character name slot - !!! should trigger error !!!
badRasch <- new('Rasch',
                name = 1,
                a = 0,
                y = c(0,1))
# Try probability
probability(testRasch, 1)
# Try probability with vector of thetas - !!! should trigger error !!!
probability(testRasch, 1:3)
# Try likelihood
likelihood(testRasch, 1)
# Try prior
prior(1)
# Try prior with vector of thetas - !!! should trigger error !!!
prior(testRasch, 1:3)
# Try eap
eap(testRasch)
# Try plot
plot(testRasch)
# Try fisherInf
fisherInf(testRasch, 0)
# Try testInf
testInf(testRasch, c(-6,6))
