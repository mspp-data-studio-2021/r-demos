# This script downloads the PLUTO dataset from NYC City Plannings Bytes of the
# Big Apple. First we create a new folder "/data-raw" if it doesn't already
# exist, then download the zip file if we haven't already. Then we unzip it to
# get the CSV file, if we haven't already.

# The CSV file is quite large, so we'll gitignore it, but leave the zip file so
# that for others using the project that can simple extract it.

library(fs) # cross-platform, uniform file system operations
library(zip) # cross-platform ‘zip’ compression

dir_create("data-raw")

zip_file <- path("data-raw", "pluto_20v4.zip")

if (!file_exists(zip_file)) {
  download.file(
    "https://www1.nyc.gov/assets/planning/download/zip/data-maps/open-data/nyc_pluto_20v4_csv.zip",
    path("data-raw", "pluto_20v4.zip"),
    mode = "wb"
  )
}

csv_file <- path("data-raw", "pluto_20v4.csv")

if (!file_exists(csv_file)) {
  unzip(zip_file, exdir = path("data-raw"))
}

