pullSearchesGA <- function(GAprofile,startDate,endDate) {

  # taken from http://stackoverflow.com/questions/6434663/r-why-does-looping-over-a-date-object-result-in-a-numeric-iterator
  days <- seq(from=as.Date(startDate), to=as.Date(endDate),by='days')
  
  result <- data.frame()
  master <- data.frame()
  
  for ( i in seq_along(days) )
  {
    print(days[i])
    result <- ga$getData(GAprofile, start.date = days[i], end.date = days[i], metrics=("ga:visits,ga:visitsWithEvent,ga:totalEvents,ga:eventValue"), dimensions = "ga:date,ga:eventCategory,ga:eventAction,ga:eventLabel", sort = "", filters = "ga:eventCategory==Discovery", segment = "", batch = TRUE)
    print(paste(nrow(result), "rows", ""))
    master <- rbind(master,result)
    print("")
  }  
  
  return(master)
  
}

pullBartonPlusResults <- function(GAprofile,startDate,endDate) {
  
  # Taken from http://stackoverflow.com/questions/6434663/r-why-does-looping-over-a-date-object-result-in-a-numeric-iterator
  days <- seq(from=as.Date(startDate), to=as.Date(endDate),by='days')
  
  result <- data.frame()
  master <- data.frame()
  
  # Extract records from Analytics API
  for ( i in seq_along(days) )
  {
    print(days[i])
    result <- ga$getData(GAprofile, start.date = days[i], end.date = days[i], metrics=("ga:visits,ga:visitsWithEvent,ga:totalEvents,ga:eventValue"), dimensions = "ga:date,ga:eventCategory,ga:eventAction,ga:eventLabel", sort = "", filters = "ga:eventAction==Result", segment = "", start = 1, batch=TRUE)
    master <- rbind(master,result)
  }  
  
  # Additional parsing of extracted records
  details <- sapply(master[,4], jsonlite::fromJSON) # Produces a large matrix
  details <- t(details) # Transpose
  details <- as.data.frame(details) # Convert to data frame
  for ( i in 1:7 ) {
    details[,i] <- as(details[,i],"character") # Convert each column to character
  }

  # Combine two data frames and save
  master <- cbind(master,details) # Column-bind with original

  return(master)
  
}

pullBartonPlusClicks <- function(GAprofile,startDate,endDate) {
  
  # Taken from http://stackoverflow.com/questions/6434663/r-why-does-looping-over-a-date-object-result-in-a-numeric-iterator
  days <- seq(from=as.Date(startDate), to=as.Date(endDate),by='days')
  
  result <- data.frame()
  master <- data.frame()
  
  # Extract records from Analytics API
  for ( i in seq_along(days) )
  {
    print(days[i])
    result <- ga$getData(GAprofile, start.date = days[i], end.date = days[i], metrics=("ga:visits,ga:visitsWithEvent,ga:totalEvents,ga:eventValue"), dimensions = "ga:date,ga:eventCategory,ga:eventAction,ga:eventLabel", sort = "", filters = "ga:eventAction==Clicked", segment = "", start = 1, batch=TRUE)
    master <- rbind(master,result)
  }  
  
  # Additional parsing of extracted records
  details <- sapply(master[,4], jsonlite::fromJSON) # Produces a large matrix
  details <- t(details) # Transpose
  details <- as.data.frame(details) # Convert to data frame
  for ( i in 1:6 ) {
    details[,i] <- as(details[,i],"character") # Convert each column to character
  }

  # Combine two data frames and save
  master <- cbind(master,details) # Column-bind with original

  return(master)
  
}
