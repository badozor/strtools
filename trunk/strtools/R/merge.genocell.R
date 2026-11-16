merge.genocell <-
function (x, y, ...) 
{
    if (!inherits(x, "genocell")) 
        stop("non convenient argument")
    if (!inherits(y, "genocell")) 
        stop("non convenient argument")
    vec <- intersect(names(attributes(x)$bloc), names(attributes(y)$bloc))
    lw <- list()
    xbloc <- attributes(x)$bloc
    xfac <- attributes(x)$fac
    ybloc <- attributes(y)$bloc
    yfac <- attributes(y)$fac
    ntot <- nrow(x) + nrow(y)
    for (i in 1:length(vec)) {
        w1 <- x[, xfac == vec[i]]
        w2 <- y[, yfac == vec[i]]
        auxivec <- union(colnames(w1), colnames(w2))
        res <- matrix(0, nrow = ntot, ncol = length(auxivec))
        res[1:nrow(x), match(colnames(w1), auxivec)] <- as.matrix(w1)
        res[(nrow(x) + 1):ntot, match(colnames(w2), auxivec)] <- as.matrix(w2)
        res <- as.data.frame(res)
        rownames(res) <- c(rownames(x), rownames(y))
        colnames(res) <- auxivec
        lw[[i]] <- res
        res <- NULL
    }
    names(lw) <- vec
    w <- as.data.frame(do.call("cbind", lw))
    nbloc <- unlist(lapply(lw, ncol))
    colnames(w) <- unlist(lapply(lw, colnames))
    attr(w, "bloc") <- nbloc
    attr(w, "levels") <- unlist(lapply(lw, colnames))
    attr(w, "fac") <- as.factor(rep(names(nbloc), nbloc))
    attr(w, "indica") <- c(rep(1, nrow(x)), rep(2, nrow(y)))
    class(w) <- c("genocell", class(w))
    return(w)
}
