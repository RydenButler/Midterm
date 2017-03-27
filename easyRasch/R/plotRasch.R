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
            # Record wrong answers
            Wrongs <- which(raschObj@y == 0)
            
            # Change graphical parameters to graph 2 rows of 5 items
            par(mfrow = c(2,4), oma = c(0, 0, 2, 0))
            plot(0.5, type = 'n', axes = F, xlab = '', ylab = '')
            # Add legend for whole plot
            legend('center', c('Correct Answer', 'Incorrect Answer', 'Theta'), 
                   col = c('green', 'red', 'black'), lty = c(1, 1, 2), bty = 'n',
                   cex = 0.5, xjust = 1)            
            # Set tally to record iterations
            tally <- 0
            # For each item difficulty
            for(i in raschObj@a){
              # Update tally
              tally <- tally + 1
              # Create a response function that depends only on theta
              ResponseFunction <- function(theta) {
                return(exp(theta - i)/(1 + exp(theta - i)))
              }
              # Create empty plot with desired axis labels and title
              plot(0.5, type = 'n', xlim = c(-6, 6), ylim = c(0, 1), axes = F,
                   xlab = expression(paste('Ability (', theta, ')')),
                   ylab = 'Pr(Correct Answer)', main = paste('Item', tally))
              # Add axes
              axis(1, at = seq(from = -6, to = 6, by = 2))
              axis(2, at = seq(from = 0, to = 1, by = 0.1), las = 2)
              # If user specifies to showTheta (default)
              if(showTheta == T) {
                # Draw dashed line at theta hat
                abline(v = Theta, lty = 2)
              }
              # If the tally indicates the iteration is for a wrong question
              if(tally %in% Wrongs){
                # Plot wrong answer in red
                curve(ResponseFunction, add = T, col = 'red') 
                # Plot right answer in green
              } else curve(ResponseFunction, add = T, col = 'green')
            }
            # Reset mfrow parameter for later plotting
            par(mfrow = c(1,1), oma = c(0, 0, 0, 0))
            # Add title to whole plot
            mtext(paste0(raschObj@name, '\'s Test Results'), outer = T, cex = 1.5)
          }
          )