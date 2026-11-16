heterozygosity.genocell <-
function (x, summary = TRUE, ...) 
{
    if (!inherits(x, "genocell")) 
        stop("non convenient argument")
    fac <- attributes(x)$fac
    res <- list()
    for (i in 1:nlevels(fac)) {
        w <- x[, fac == levels(fac)[i]]
        homo <- unlist(apply(w, 1, function(z) sum(z > 0) == 
            1 & !any(is.na(z))))
        Na <- unlist(apply(w, 1, function(z) sum(z) == 0 & !any(is.na(z))))
        hetero <- !homo & !Na
        mt2 <- unlist(apply(w, 1, function(z) sum(z > 0) > 2 & 
            !any(is.na(z))))
        res[[i]] <- cbind(homo, hetero, Na, mt2)
    }
    names(res) <- levels(fac)
    if (summary) {
        res <- data.frame(do.call("rbind", lapply(res, function(z) apply(z, 
            2, sum, na.rm = TRUE))))
        res$n <- apply(res[, 1:2], 1, sum, na.rm = TRUE)
        res$N <- apply(res[, 1:3], 1, sum, na.rm = TRUE)
        res$Nallele <- table(fac)
    }
    return(res)
}
