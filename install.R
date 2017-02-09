#############################################################################
# Installation of packages

# Devtools
install.packages("devtools")
library(devtools)

# RGA
# IMPORTANT - do not just browse for "rga" in CRAN - there is a different package there.
install_github("skardhamar/rga")
library("rga")

# Other libraries
library(jsonlite)
library(plyr)

# configure rga
options(RCurlOptions = list(verbose = FALSE, capath = system.file("CurlSSL", "cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE))
rga.open(instance="ga", where="~/ga.rga")
