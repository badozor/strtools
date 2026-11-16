simAIJ.peak <-
function (peak, R = 10) 
{
    a <- NULL
    for (i in 1:R) {
        a <- c(a, sum(sample(c(0, 1), peak, replace = TRUE)))
    }
    return(a)
}
