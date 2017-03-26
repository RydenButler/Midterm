#' Calculate prior for Rasch model
#' 
#' Calculates the prior probability of a proposed ability parameter (theta) for 
#' a \code{Rasch} object. The prior is always normally distributed with mean 0 and
#' standard deviation 3.
#' 
#' @param theta A proposed value of theta
#' 
#' @return A list with one element
#'  \item{pi}{The height of the specified normal curve evaluated at theta}
#'  
#'  @author Ryden W. Butler: \email{r.butler@@wustl.edu}
#'  @examples 
#'  
#'  prior(0)
#'  @seealso EAP
#'  @rdname prior
#'  @aliases prior,ANY-method
#'  @export
setGeneric(name = 'prior',
           def = function(theta, ...) {
             standardGeneric('prior')
           }
           )
#' @export
setMethod(f = 'prior',
          definition = function(theta, ...) {
            return(list(pi = dnorm(x = theta, mean = 0, sd = 3)))
          }
          )