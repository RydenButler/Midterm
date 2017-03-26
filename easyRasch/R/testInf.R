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
            VectorFishInf <- Vectorize(fisherInf, 'theta', SIMPLIFY = F)
            EvaluateAt <- seq(from = thetaLim[1], to = thetaLim[2], by = 0.001)
            InfoList <- VectorFishInf(raschObj, EvaluateAt)
            TestInfos <- lapply(InfoList, sum)
            plot(1, type = 'n', xlim = thetaLim, ylim = c(0,max(unlist(TestInfos))), 
                 xlab = 'Ability (theta)', ylab = 'Test Information', axes = F, 
                 main = 'Test Information Curve')
            axis(1, at = thetaLim[1]:thetaLim[2])
            axis(2, at = seq(from = 0, to = ceiling(max(unlist(TestInfos))), by = 0.5), 
                 las = 2)
            points(x = EvaluateAt, y = TestInfos, pch = 2, cex = 0.01)
          }
          )