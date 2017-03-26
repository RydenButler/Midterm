#' Calculate likelihood for Rasch model
#' 
#' Calculates the likelihood of a proposed ability parameter (theta) given observed
#' responses (y) from a \code{Rasch} object.
#' 
#' @param raschObj An object of class \code{Rasch}
#' @param theta A proposed value of theta
#' 
#' @return A numeric scalar indicating the likelihood of theta
#'  
#'  @author Ryden W. Butler: \email{r.butler@@wustl.edu}
#'  @examples 
#'  
#'  exRasch <- new('Rasch', name = 'Me', a = 0, y = 1)
#'  likelihood(exRasch, 0)
#'  @seealso probability
#'  @rdname likelihood
#'  @aliases likelihood,ANY-method
#'  @export
setGeneric(name = 'likelihood',
           def = function(raschObj, theta, ...) {
             standardGeneric('likelihood')
           }
           )
#' @export
setMethod(f = 'likelihood',
          definition = function(raschObj, theta, ...) {
            # Products the mixed probability vector (of Ps and Qs) from probability
            return(prod(probability(raschObj, theta)$Mixed))
          }
          )