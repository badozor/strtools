recode.STR1col <-
function (df, sep = ",", method = "fuzzy", ...) 
{
    if (!inherits(df, "data.frame")) 
        stop("non convenient argument!")
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
    df <- as.data.frame(apply(df, 2, as.character), row.names = rownames(df), 
        stringsAsFactors = FALSE)
    lw <- list()
    for (i in 1:ncol(df)) {
        auxi <- df[, i]
        level1 <- na.omit(as.character(auxi))
        level1 <- unique(unlist(strsplit(level1, sep)))
        auxi <- t(sapply(auxi, function(x) transfac(as.character(x), 
            level1, method, sep)))
        rownames(auxi) <- rownames(df)
        lw[[i]] <- auxi
    }
    names(lw) <- colnames(df)
    w <- as.data.frame(do.call("cbind", lw))
    nbloc <- unlist(lapply(lw, function(x) ifelse(is.null(nrow(x)), 
        1, ncol(x))))
    auxinames <- NULL
    k2 <- 0
    for (i in 1:length(nbloc)) {
        k1 <- k2 + 1
        k2 <- k2 + nbloc[i]
        auxinames <- c(auxinames, paste(names(nbloc)[i], colnames(w)[k1:k2], 
            sep = "."))
    }
    colnames(w) <- auxinames
    attr(w, "bloc") <- nbloc
    attr(w, "levels") <- unlist(lapply(lw, colnames))
    attr(w, "fac") <- as.factor(rep(names(nbloc), nbloc))
    class(w) <- c("genocell", class(w))
    return(w)
}
