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
#' @export
setClass(Class = 'Rasch',
         slots = c(name = 'character', a = 'numeric', y = 'numeric')
         )