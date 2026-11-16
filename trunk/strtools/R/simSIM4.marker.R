simSIM4.marker <-
function (marker = 8, R = 999) 
{
    N <- 2 * marker
    x1 <- sample(marker:N, 1)
    x2 <- sample(marker:N, 1)
    obs <- sum(sample(c(0, 1), min(c(x2, x1)), replace = TRUE))
    sim <- simAIJ.peak(min(sum(x1), sum(x2)), R)
    w <- as.randtest(sim = sim, obs = obs, call = match.call())
    return(w)
}
