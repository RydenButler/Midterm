#' Plots the test information for a Rasch model
#' 
#' Plots the test information for a broad range of (user-specified) theta values
#' from a \code{Rasch} object.
#' 
#' @param x An object of class \code{Rasch}
#' @param thetaLim A two-element vector specifying the starting and ending values of theta.
#' 
#' @return A plot of a test information curve
#'  
#'  @author Ryden W. Butler: \email{r.butler@@wustl.edu}
#'  @examples 
#'  
#'  exRasch <- new('Rasch', name = 'Me', a = 0, y = 1)
#'  testInf(exRasch)
#'  @seealso fisherInf, plotRasch
#'  @rdname testInf
#'  @aliases plot,ANY-method
#'  @export
setGeneric(name = 'testInf',
           def = function(raschObj, thetaLim) {
             standardGeneric('testInf')
           }
           )
#' @export
setMethod(f = 'testInf',
          definition = function(raschObj, thetaLim = c(-3, 3)) {
            # fisherInf is not vectorized for users to input multiple thetas. 
            # Therefore I vectorize it for efficiency here alone
            VectorFishInf <- Vectorize(fisherInf, 'theta', SIMPLIFY = F)
            # Specify large number of points to evaluate theta
            EvaluateAt <- seq(from = thetaLim[1], to = thetaLim[2], by = 0.01)
            # Generate vectorized output of fisherInfs in list
            InfoList <- VectorFishInf(raschObj, EvaluateAt)
            # Get test information at each theta
            TestInfos <- lapply(InfoList, sum)
            # Plot empty window with labels
            plot(1, type = 'n', xlim = thetaLim, ylim = c(0,max(unlist(TestInfos))+0.25), 
                 xlab = expression(paste('Ability (', theta, ')')), ylab = 'Test Information', axes = F, 
                 main = 'Test Information Curve')
            # Add axes
            axis(1, at = thetaLim[1]:thetaLim[2])
            axis(2, at = seq(from = 0, to = (ceiling(max(unlist(TestInfos)))+0.25), 
                             by = 0.25), las = 2)
            # Add test information points along domain of thetas
            points(x = EvaluateAt, y = TestInfos, pch = 2, cex = 0.01)
          }
          )