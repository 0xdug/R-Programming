complete <- function(directory, id = 1:332) {
  files <- list.files(path = directory, full.names = TRUE)
  dataFile <- data.frame()
  nobs <- data.frame()
  completeCases <- data.frame()
  for (i in id) { 
    dataFile <- (read.csv(files[i], header=TRUE))
    #the function complete.cases() returns a logical vector indicating which cases are complete
    nobs <- sum(complete.cases(dataFile))
    completeCases <- rbind(completeCases, data.frame(i, nobs))
  }
  names(completeCases) <- c("id", "nobs")
  completeCases
}
