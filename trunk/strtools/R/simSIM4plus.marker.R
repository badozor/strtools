simSIM4plus.marker <-
function (marker = 9, R = 999, nrep = 999) 
{
    w <- NULL
    for (i in 1:R) {
        w <- c(w, simSIM4.marker(marker = marker, R = nrep)$pvalue)
    }
    return(w)
}
