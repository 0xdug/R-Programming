pollutantmean <- function(directory, pollutant, id = 1:332) {
  files <- list.files(directory, full.names = TRUE)
  particulateMatter <- data.frame()
  for(i in id) {
    particulateMatter <- rbind(particulateMatter, read.csv(files[i]))
  }
  mean(particulateMatter[,pollutant], na.rm = TRUE)
}
