#' Calculate probabilities for Rasch model
#' 
#' Calculates the probabilities of correct responses (P) and incorrect responses (Q)
#' for a \code{Rasch} object.
#' 
#' @param raschObj An object of class \code{Rasch}
#' @param theta A proposed value of theta
#' 
#' @return A list with the elements
#'  \item{P}{A vector of length n that represents P for each question}
#'  \item{Mixed}{A vector of length n that represents P if the question is answered
#'  correctly and Q otherwise}
#'  
#'  @author Ryden W. Butler: \email{r.butler@@wustl.edu}
#'  @examples 
#'  
#'  exRasch <- new('Rasch', name = 'Me', a = 0, y = 1)
#'  probability(exRasch, 0)
#'  @seealso likelihood
#'  @rdname probability
#'  @aliases probability,ANY-method
#'  @export
setGeneric(name = 'probability',
           def = function(raschObj, theta) {
             standardGeneric('probability')
           }
           )
#' @export
setMethod(f = 'probability',
          definition = function(raschObj, theta) {
            if(length(theta) > 1) stop(' probability() is not vectorized. \nInput only one proposed value of theta.')
            Numerator <- exp(theta - raschObj@a)
            P <- Numerator/(1 + Numerator)
            Q <- 1 - P
            Wrongs <- which(raschObj@y == 0)
            Mixed <- P
            Mixed[Wrongs] <- Q[Wrongs]
            return(list(P = P, Mixed = Mixed))
          }
          )