#' Calculate prior for Rasch model
#' 
#' Calculates the prior probability of a proposed ability parameter (theta) for 
#' a \code{Rasch} object. The prior is always normally distributed with mean 0 and
#' standard deviation 3.
#' 
#' @param theta A proposed value of theta
#' 
#' @return A numeric scalar indicating the height of the normal curve at the quantile of theta
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
            # Throw error if user attempts to enter vector of proposed thetas
            if(length(theta) > 1) stop(' prior() is not vectorized. \nInput only one proposed value of theta.')
            # Return list of one element, pi, containing a single numeric scalar
            return(dnorm(x = theta, mean = 0, sd = 3))
          }
          )