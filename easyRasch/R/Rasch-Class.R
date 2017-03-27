#' An object for calculating simple Rasch models
#' 
#' An object of class \code{Rasch} for use in estimating the ability parameter (theta)
#' of test takers. For use with \code{makeRasch}.
#' 
#' 
#' An object of class \code{Rasch} has the following slots:
#' @slot name The name of the test taker
#' @slot a A vector of question-item parameters
#' @slot y A vector of answers for the respondent
#' 
#' @author Ryden W. Butler: \email{r.butler@@wustl.edu}
#' @rdname Rasch

# Write validation function for Rasch object
examineRasch <- function(object) {
  # Create empty object to store errors
  Errors <- character()
  # The slot classes are checked by validObject() by default
  # I only need to add odd exceptions like those below
  
  # Check that y is in binary format
  if(any(object@y > 1) | any(object@y < 0)) {
    Message <- 'Slot y must only have answers input as correct (1) or incorrect (0)'
    Errors <- c(Errors, Message)
  }
  # Check that each item has a correspoding difficulty and answer
  if(length(object@a) != length(object@y)) {
    Message <- 'Slots a and y must be of the same length'
    Errors <- c(Errors, Message)
  }
  # Print errors if applicable
  if(length(Errors) == 0) TRUE else Errors
}

#' @export
setClass(Class = 'Rasch',
         slots = c(name = 'character', a = 'numeric', y = 'numeric'),
         validity = examineRasch
         )
