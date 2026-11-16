recode.STR2col <-
function (df, bloc, sep = "[-]", method = "fuzzy", ...) 
{
    if (!inherits(df, "data.frame")) 
        stop("non convenient argument!")
    if (ncol(df) != length(bloc)) 
        stop("non equal dimension")
    transfac <- function(x, level, type, sep = "") {
        fx0 <- rep(0, length(level))
        fx1 <- factor(unlist(strsplit(x, sep)), levels = level)
        if (type == "binary") {
            if (!all(is.na(fx1))) 
                fx0[as.numeric(na.omit(fx1))] <- rep(1, length(na.omit(fx1)))
        }
        else {
            fx0 <- as.vector(table(fx1))
        }
        names(fx0) <- level
        fx0
    }
    bloc <- as.factor(bloc)
    df <- as.data.frame(apply(df, 2, as.character), row.names = rownames(df), 
        stringsAsFactors = FALSE)
    lw <- list()
    for (i in 1:nlevels(bloc)) {
        auxi <- df[, bloc == levels(bloc)[i]]
        level1 <- na.omit(as.character(unlist(auxi)))
        level1 <- unlist(strsplit(level1, sep))
        level1 <- unique(level1)
        lw[[i]] <- apply(auxi, 1, function(x) transfac(as.character(x), 
            level1, method, sep))
    }
    names(lw) <- levels(bloc)
    w <- as.data.frame(t(do.call("rbind", lw)))
    nbloc <- unlist(lapply(lw, function(x) ifelse(is.null(nrow(x)), 
        1, nrow(x))))
    auxinames <- NULL
    k2 <- 0
    for (i in 1:nlevels(bloc)) {
        k1 <- k2 + 1
        k2 <- k2 + nbloc[i]
        if (nbloc[i] == 1) {
            tmp <- paste(levels(bloc)[i], unique(df[, bloc == 
                levels(bloc)[i]][, 1]), sep = ".")
        }
        else {
            tmp <- paste(levels(bloc)[i], colnames(w)[k1:k2], 
                sep = ".")
        }
        auxinames <- c(auxinames, tmp)
    }
    colnames(w) <- auxinames
    attr(w, "bloc") <- nbloc
    attr(w, "levels") <- unlist(lapply(lw, rownames))
    attr(w, "fac") <- as.factor(rep(names(nbloc), nbloc))
    class(w) <- c("genocell", class(w))
    return(w)
}
