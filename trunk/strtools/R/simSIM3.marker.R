simSIM3.marker <-
function (marker = 9, R = 999) 
{
    N <- marker * 2
    w <- NULL
    for (i in 1:R) {
        x1 <- sample(marker:N, 1)
        x2 <- sample(marker:N, 1)
        a <- sum(sample(c(0, 1), min(c(x2, x1)), replace = TRUE))
        w <- c(w, a)
    }
    return(w)
}
