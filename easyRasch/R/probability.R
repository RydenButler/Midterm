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
            # Throw error if user attempts to enter vector of proposed thetas
            if(length(theta) > 1) stop(' probability() is not vectorized. \nInput only one proposed value of theta.')
            # Calculate numerator
            Numerator <- exp(theta - raschObj@a)
            # Calculate probability
            P <- Numerator/(1 + Numerator)
            # Calculate inverse probability
            Q <- 1 - P
            # Note which responses are incorrect
            Wrongs <- which(raschObj@y == 0)
            # Create object of mixed Ps and Qs by first copying P...
            Mixed <- P
            # ... and then overwriting wrong answers with Q
            Mixed[Wrongs] <- Q[Wrongs]
            # Return list of results, P and mixed Ps and Qs
            return(list(P = P, Mixed = Mixed))
          }
          )