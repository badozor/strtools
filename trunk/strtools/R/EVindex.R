EVindex <-
function (x, y = NULL, ...) 
{
# based the fonction dist.binary of the R package ade4: http://pbil.univ-lyon1.fr/ade4/ 
# if y is null, => dist.binary, method=5
    if (!(inherits(x, "data.frame") | inherits(x, "matrix"))) 
        stop("x is not a data.frame or a matrix")
    if (!is.null(y)) 
        if (!(inherits(y, "data.frame") | inherits(y, "matrix"))) 
            stop("y is not a data.frame or a matrix")
    x <- as.matrix(x)
    if (!is.numeric(x)) 
        stop("x must contain  numeric values")
    if (any(x < 0, na.rm = TRUE)) 
        stop("non negative value expected in x")
    x <- as.matrix(1 * (x > 0))
    if (!is.null(y)) {
        y <- as.matrix(y)
        if (!is.numeric(y)) 
            stop("y must contain  numeric values")
        if (any(y < 0, na.rm = TRUE)) 
            stop("non negative value expected in y")
        y <- as.matrix(1 * (y > 0))
    }
    f1 <- function(df) {
        a <- df %*% t(df)
        b <- df %*% (1 - t(df))
        c <- (1 - df) %*% t(df)
        d <- ncol(df) - a - b - c
        2 * a/(2 * a + b + c)
    }
    f2 <- function(df1, df2) {
        a <- df1 %*% t(df2)
        b <- df1 %*% (1 - t(df2))
        c <- (1 - df1) %*% t(df2)
        d <- (1 - df1) %*% (1 - t(df2))
        2 * a/(2 * a + b + c)
    }
    if (is.null(y)) {
        w <- f1(x)
        w <- as.data.frame(w)
        if (!is.null(rownames(x))) {
            rownames(w) <- rownames(x)
            colnames(w) <- rownames(x)
        }
    }
    else {
        w <- f2(x, y)
        w <- as.data.frame(w)
        if (!is.null(rownames(x))) 
            rownames(w) <- rownames(x)
        if (!is.null(rownames(y))) 
            colnames(w) <- rownames(y)
    }
    return(w)
}
