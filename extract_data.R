// Initialization before pulling any data
library("rga", lib.loc="C:/Users/mjbernha/Documents/R/win-library/2.15")
options(RCurlOptions = list(verbose = FALSE, capath = system.file("CurlSSL", "cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE))
rga.open(instance="ga")

// Load data 
test <- iconv(ga$getData("ga:3176566", start.date = "2015-02-12", end.date = "2015-02-12", metrics=("ga:visits,ga:visitsWithEvent,ga:totalEvents,ga:eventValue"), dimensions = "ga:date,ga:eventCategory,ga:eventAction,ga:eventLabel", sort = "", filters = "ga:eventCategory==Discovery", segment = ""), "UTF-8")

// GA properties
// libraries.mit.edu - 3176566
// BartonPlus        - 69335632

// searchAnalytics functions
// Fall13SearchesPartial <- pullSearchesGA("ga:3176566","2013-06-16","2013-11-09")
// Nov12Results <- pullBartonPlusResults("ga:69335632","2013-11-12","2013-11-12")
// write.csv(Results2, file="Results2.csv")
FrontPage4 <- pullSearchesGA("ga:3176566","2013-06-23","2013-11-30")
Results1 <- pullBartonPlusResults("ga:69335632","2013-06-18","2013-08-23")
Results2 <- pullBartonPlusResults("ga:69335632","2013-08-25","2013-09-10")
Results3 <- pullBartonPlusResults("ga:69335632","2013-09-12","2013-09-13")
Results4 <- pullBartonPlusResults("ga:69335632","2013-10-01","2013-11-30")
Results5 <- pullBartonPlusResults("ga:69335632","2013-12-01","2014-01-27")
Results <- data.frame()
Results <- rbind(Results,Results1)
Results <- rbind(Results,Results2)
Results <- rbind(Results,Results3)
Results <- rbind(Results,Results4)
write.csv(Results, file="results.csv")
Results5 <- pullBartonPlusResults("ga:69335632","2013-12-01","2014-01-27")
Results140127 <- rbind(Results,Results5)
write.csv(Results140127, file="results_140127.csv")
Results6 <- pullBartonPlusResults("ga:69335632","2014-01-28","2014-07-30")

// Export to JSON
FrontPageJSON = unname(apply(FrontPage1,1, function(x) as.data.frame(t(x))))
writeLines(toJSON(FrontPageJSON), "FrontPage.json")

FrontPageCleanedJSON = unname(apply(FrontPageCleaned,1, function(x) as.data.frame(t(x))))
writeLines(toJSON(FrontPageCleanedJSON), "FrontPageCleaned.json")

// Extract FY14 results
FY14_results1 <- pullBartonPlusResults("ga:69335632","2013-07-01","2013-08-23")
// Invalid character in 8/24 results
FY14_results2 <- pullBartonPlusResults("ga:69335632","2013-08-25","2013-09-10")
// Invalid character in 9/11 results
FY14_results3 <- pullBartonPlusResults("ga:69335632","2013-09-12","2013-09-13")
// No data collected from 9/14 - 9/30 due to a code change within EDS
FY14_results4 <- pullBartonPlusResults("ga:69335632","2013-10-01","2014-06-30")
FY14_results <- rbind(FY14_results1,FY14_results2,FY14_results3,FY14_resultstest)

// Extract January 2015 data
Clicks1501 <- pullBartonPlusClicks("ga:69335632","2015-01-01","2015-01-31")
Results1501 <- pullBartonPlusResults("ga:69335632","2015-01-01","2015-01-31")
FrontPage1501a <- pullSearchesGA("ga:3176566","2015-01-01","2015-01-09")
FrontPage1501b <- pullSearchesGA("ga:3176566","2015-01-10","2015-01-31")
FrontPage1501 <- data.frame()
FrontPage1501 <- rbind(FrontPage1501,FrontPage1501a)
FrontPage1501 <- rbind(FrontPage1501,FrontPage1501b)
write.csv(Clicks1501,file="Clicks1501.csv")
write.csv(Results1501,file="Results1501.csv")
write.csv(FrontPage1501,file="Searches1501.csv")
