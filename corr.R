corr <- function(directory, threshold = 0) {
  source("complete.R")
  completeCases <- complete(directory)
  observedCases <- completeCases[completeCases$nobs > threshold,1]
  files <- list.files(path = directory, full.names = TRUE)
  #correlations <- rep(NA, length(observedCases))
  for (i in observedCases) {
    readData <- (read.csv(files[i]))
    completeCases <- complete.cases(readData)
    sulfate <- readData[completeCases, 2]
    nitrate <- readData[completeCases, 3]
    correlations[i] <- cor(x = sulfate, y = nitrate)
  }
  correlations <- correlations[complete.cases(correlations)]
}
