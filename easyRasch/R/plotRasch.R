#' Plots ICCs for Rasch model
#' 
#' Plots the item characteristic curves for a user whose information is contained 
#' within a \code{Rasch} object.
#' 
#' @param x An object of class \code{Rasch}
#' @param showTheta A logical indicating whether the plot should show the theta 
#' estimate for the user.
#' 
#' @return A plot of item characteristic curves
#'  
#'  @author Ryden W. Butler: \email{r.butler@@wustl.edu}
#'  @examples 
#'  
#'  exRasch <- new('Rasch', name = 'Me', a = 0, y = 1)
#'  plot(exRasch)
#'  @seealso probability
#'  @rdname plotRasch
#'  @aliases plot,ANY-method
#'  @export
setMethod(f = 'plot', signature = 'Rasch',
          definition = function(x, showTheta = TRUE, ...) {
            # Set raschObj as x
            raschObj <- x
            # Estimate theta
            Theta <- eap(raschObj)
            Wrongs <- which(raschObj@y == 0)
            
            opar <- par()
            par(mfrow = c(2,4))
            tally <- 0
            for(i in raschObj@a){
              tally <- tally + 1
              ResponseFunction <- function(theta) {
                return(exp(theta - i)/(1 + exp(theta - i)))
              }
              plot(0.5, type = 'n', xlim = c(-6, 6), ylim = c(0, 1), axes = F,
                   xlab = 'Ability (theta)', ylab = 'Pr(Correct Answer)',
                   main = paste('Item', tally))
              axis(1, at = -6:6)
              axis(2, at = seq(from = 0, to = 1, by = 0.1), las = 2)
              if(showTheta == T) {
                abline(v = Theta, lty = 2)
              }
              if(tally %in% Wrongs){
                curve(ResponseFunction, add = T, col = 'red') 
              } else curve(ResponseFunction, add = T, col = 'green')
            }
            par(opar)
          }
          )