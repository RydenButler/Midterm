#' Calculate the Fisher's Information for a Rasch model
#' 
#' Calculates the observed Fisher's Information for each question in a test given
#' the test taker's ability parameter (theta) from a \code{Rasch} object.
#' 
#' @param raschObj An object of class \code{Rasch}
#' @param theta A proposed value of theta
#' 
#' @return A vector of Fisher's Information values corresponding to the number of items
#'  
#'  @author Ryden W. Butler: \email{r.butler@@wustl.edu}
#'  @examples 
#'  
#'  exRasch <- new('Rasch', name = 'Me', a = 0, y = 1)
#'  fisherInf(exRasch, 0)
#'  @seealso eap
#'  @rdname fisherInf
#'  @aliases fisherInf,ANY-method
#'  @export
setGeneric(name = 'fisherInf',
           def = function(raschObj, theta) {
             standardGeneric('fisherInf')
           }
           )
#' @export
setMethod(f = 'fisherInf',
          definition = function(raschObj, theta) {
            # Store P
            P <- probability(raschObj, theta)$P
            # Return I in list
            return(P*(1 - P))
          }
          )