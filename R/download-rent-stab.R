# Download Rent Stabilization data
# https://github.com/talos/nyc-stabilization-unit-counts#user-content-data-usage


library(fs) # cross-platform, uniform file system operations

dir_create("data-raw")

rent_stab_file <- path("data-raw", "rent-stab-units_joined_2007-2017.csv")

if (!file_exists(rent_stab_file)) {
  download.file(
    "http://taxbills.nyc/joined.csv",
    rent_stab_file
  )
}