pullSearchesGA <- function(GAprofile,startDate,endDate) {

  # taken from http://stackoverflow.com/questions/6434663/r-why-does-looping-over-a-date-object-result-in-a-numeric-iterator
  days <- seq(from=as.Date(startDate), to=as.Date(endDate),by='days')
  
  result <- data.frame()
  master <- data.frame()
  
  for ( i in seq_along(days) )
  {
    print(i)
    print(days[i])
    result <- ga$getData(GAprofile, start.date = days[i], end.date = days[i], metrics=("ga:visits,ga:visitsWithEvent,ga:totalEvents,ga:eventValue"), dimensions = "ga:date,ga:eventCategory,ga:eventAction,ga:eventLabel", sort = "", filters = "ga:eventCategory==Discovery", segment = "")    
    print("  Bind to master")
    master <- rbind(master,result)
  }  
  
  return(master)
  
}
pullBartonPlusResults <- function(GAprofile,startDate,endDate) {
  
  # taken from http://stackoverflow.com/questions/6434663/r-why-does-looping-over-a-date-object-result-in-a-numeric-iterator
  days <- seq(from=as.Date(startDate), to=as.Date(endDate),by='days')
  
  result <- data.frame()
  master <- data.frame()
  
  for ( i in seq_along(days) )
  {
    print(i)
    print(days[i])
    result <- ga$getData(GAprofile, start.date = days[i], end.date = days[i], metrics=("ga:visits,ga:visitsWithEvent,ga:totalEvents,ga:eventValue"), dimensions = "ga:date,ga:eventCategory,ga:eventAction,ga:eventLabel", sort = "", filters = "ga:eventAction==Result", segment = "", start = 1, batch=TRUE)
    
    master <- rbind(master,result)
  }  
  
  return(master)
  
}

pullBartonPlusClicks <- function(GAprofile,startDate,endDate) {
  
  # taken from http://stackoverflow.com/questions/6434663/r-why-does-looping-over-a-date-object-result-in-a-numeric-iterator
  days <- seq(from=as.Date(startDate), to=as.Date(endDate),by='days')
  
  result <- data.frame()
  master <- data.frame()
  
  for ( i in seq_along(days) )
  {
    print(i)
    print(days[i])
    result <- ga$getData(GAprofile, start.date = days[i], end.date = days[i], metrics=("ga:visits,ga:visitsWithEvent,ga:totalEvents,ga:eventValue"), dimensions = "ga:date,ga:eventCategory,ga:eventAction,ga:eventLabel", sort = "", filters = "ga:eventAction==Clicked", segment = "", start = 1, batch=TRUE)
    
    master <- rbind(master,result)
  }  
  
  return(master)
  
}