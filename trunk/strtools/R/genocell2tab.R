genocell2tab <- function(x,markers=NULL,sep=",",...){
	if(!inherits(x,"genocell"))
		stop("non convenient argument")
	f1 <- function(x,bloc,variables,modalities,sep){
		x <- unlist(x)
		nbloc <- length(bloc)
		w <- rep(NA,nbloc)
		for(i in 1:nbloc){
			wx <- x[variables==names(bloc)[i]]
			wm <-  modalities[variables==names(bloc)[i]]
			w[i] <- paste(sort(wm[as.logical(wx)]),collapse=sep)
		}
		w	
	}
	bloc <- attributes(x)$bloc
	res <- apply(x,1,f1,moda=attributes(x)$levels,var=attributes(x)$fac,bloc=bloc,sep=sep)
	res <- as.data.frame(t(res))
	colnames(res) <- names(bloc)
	if(!is.null(markers))
		res <- res[,is.element(colnames(res),markers)]
	return(res)
}

