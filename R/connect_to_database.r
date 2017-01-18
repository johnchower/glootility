# This folder contains tools for connecting to Gloo's analytics data sources.

# Looker:

#' Connect to Looker via the LookR package.
#' 
#' @param auth_file_location A character. Give the path of the directory where
#' your authenticate file is located. If left blank, R will search for a 
#' file named 'authenticate' in your current working directory. Set to NULL 
#' if you want to enter your credentials manually.
#' @param memory_allowed Numeric, specifies the java heap size (in gigs). Must
#' be set at a value below your system memory.
#' @param ... Additional parameters to pass to LookR::looker_setup
#' @return Connects your R session to the Looker API. No objects are returned.
#' @export

connect_to_lookr <- function(auth_file_location = '~/.auth'
#                                rprojroot::find_root(
#                                  rprojroot::has_file('authenticate')
#                                )
                              , memory_allowed = 6
                              , ...){
  # Set java memory limit
  java_param <- paste0('-Xmx', memory_allowed, 'g')
  options(java.parameters = java_param)
  # Look for an authentication file. Use it to login if one is found.
  if(is.character(auth_file_location)){
    auth_info <- readLines(
                   paste(auth_file_location, "authenticate", sep="/")
                 )
    LookR::looker_setup(id = auth_info[1]
                        , secret = auth_info[2]
                        , api_path = auth_info[3]) 
  } else {
    LookR::looker_setup(...) 
  }
}

# Postgres:

#' Connect to Postgres via the RPostgreSQL package.
#' 
#' @param auth_file_location A character. Give the path of the directory where
#' your authenticate file is located. If left blank, R will search for a 
#' file named 'authenticate' in your current working directory. Set to NULL 
#' if you want to enter your credentials manually.
#' @param ... Additional parameters to pass to RPostgreSQL::dbConnect
#' @return A list containing a driver object, drv, and a connection object,
#' con.
#' @export
#' @import RPostgreSQL
#' @import DBI

connect_to_postgres <- function(auth_file_location = '~/.auth'
#                                   rprojroot::find_root(
#                                     rprojroot::has_file('authenticate')
#                                   )
                                , ...){
  driver <- DBI::dbDriver("PostgreSQL")
  if(is.character(auth_file_location)){
    auth_info <- readLines(
                   paste(auth_file_location, "authenticate", sep="/")
                 )
    connection <- RPostgreSQL::dbConnect(
                    driver
                    , dbname = auth_info[4]
                    , host = auth_info[5]
                    , port = auth_info[6]
                    , user = auth_info[7]
                    , password = auth_info[8]
                  ) 
  } else {
    connection <- RPostgreSQL::dbConnect(
                    driver
                    , ...
                  ) 
  }
  assign("postgres_connection"
         , list(drv = driver, con = connection)
         , envir = .GlobalEnv)
}

# Redshift:

#' Connect to Redshift via the RPostgreSQL package.
#' 
#' @param auth_file_location A character. Give the path of the directory where
#' your authenticate file is located. If left blank, R will search for a 
#' file named 'authenticate' in your current working directory. Set to NULL 
#' if you want to enter your credentials manually.
#' @param ... Additional parameters to pass to RPostgreSQL::dbConnect
#' @return A list containing a driver object, drv, and a connection object,
#' con.
#' @export
#' @import RPostgreSQL
#' @import DBI

connect_to_redshift <- function(auth_file_location = '~/.auth'
#                                   rprojroot::find_root(
#                                     rprojroot::has_file('authenticate')
#                                   )
                                , ...){
  driver <- DBI::dbDriver("PostgreSQL")
  if(is.character(auth_file_location)){
    auth_info <- readLines(
                   paste(auth_file_location, "authenticate", sep="/")
                 )
    connection <- RPostgreSQL::dbConnect(
                    driver
                    , dbname = auth_info[9]
                    , host = auth_info[10]
                    , port = auth_info[11]
                    , user = auth_info[12]
                    , password = auth_info[13]
                  ) 
  } else {
    connection <- RPostgreSQL::dbConnect(
                    driver
                    , ...
                  ) 
  }
  assign("redshift_connection"
         , list(drv = driver, con = connection)
         , envir = .GlobalEnv)
}

#' Connect to Redshift dev via the RPostgreSQL package.
#' 
#' @param auth_file_location A character. Give the path of the directory where
#' your authenticate file is located. If left blank, R will search for a 
#' file named 'authenticate' in your current working directory. Set to NULL 
#' if you want to enter your credentials manually.
#' @param ... Additional parameters to pass to RPostgreSQL::dbConnect
#' @return A list containing a driver object, drv, and a connection object,
#' con.
#' @export
#' @import RPostgreSQL
#' @import DBI

connect_to_redshift_dev <- function(auth_file_location = '~/.auth'
#                                   rprojroot::find_root(
#                                     rprojroot::has_file('authenticate')
#                                   )
                                , ...){
  driver <- DBI::dbDriver("PostgreSQL")
  if(is.character(auth_file_location)){
    auth_info <- readLines(
                   paste(auth_file_location, "authenticate", sep="/")
                 )
    connection <- RPostgreSQL::dbConnect(
                    driver
                    , dbname = auth_info[14]
                    , host = auth_info[15]
                    , port = auth_info[16]
                    , user = auth_info[17]
                    , password = auth_info[18]
                  ) 
  } else {
    connection <- RPostgreSQL::dbConnect(
                    driver
                    , ...
                  ) 
  }
  assign("redshift_dev_connection"
         , list(drv = driver, con = connection)
         , envir = .GlobalEnv)
}
