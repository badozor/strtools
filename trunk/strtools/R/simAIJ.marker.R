simAIJ.marker <-
function (marker = 8, R = 10) 
{
    N <- marker * 2
    a <- NULL
    for (i in 1:R) {
        x1 <- sample(marker:N, 1)
        x2 <- sample(marker:N, 1)
        a <- c(a, sum(sample(c(0, 1), min(c(x2, x1)), replace = TRUE)))
    }
    return(a)
}
