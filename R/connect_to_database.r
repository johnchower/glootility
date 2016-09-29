# This folder contains tools for connecting to Gloo's analytics data sources.

# Looker:

connect_to_lookr <- function(auth_file_location = NULL, ...){
  if(!is.null(auth_file_location)){
    auth_info <- readLines(
                   paste(auth_file_location, "authenticate", sep="/")
                 )
    LookR::looker_setup(id = auth_info[1]
                        , secret = auth_info[2]
                        , api_path = "https://api-looker.gloo.us/api/3.0") 
  } else {
    LookR::looker_setup(...
                        , api_path = "https://api-looker.gloo.us/api/3.0") 
  }
}

# Postgres:

connect_to_postgres <- function(auth_file_location = NULL, ...){
  driver <- DBI::dbDriver("PostgreSQL")
  if(!is.null(auth_file_location)){
    auth_info <- readLines(
                   paste(auth_file_location, "authenticate", sep="/")
                 )
    connection <- RPostgreSQL::dbConnect(
             driver
             , dbname="polymer_production"
             , host="localhost"
             , port=5442
             , user = auth_info[3]
             , password = auth_info[4]
           ) 
  } else {
    connection <- RPostgreSQL::dbConnect(
             driver
             , dbname="polymer_production"
             , host="localhost"
             , port=5442
             , ...
           ) 
  }
  list(drv = driver, con = connection)
}
