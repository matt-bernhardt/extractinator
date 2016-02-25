# This script installs necessary packages

# rga (R for Google Analytics) requires devtools
install.packages("devtools")
library(devtools)

# install rga itself
install_github("skardhamar/rga")

# enable rga
library("rga")

# configure rga
options(RCurlOptions = list(verbose = FALSE, capath = system.file("CurlSSL", "cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE))
rga.open(instance="ga")
