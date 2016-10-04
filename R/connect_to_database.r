# This folder contains tools for connecting to Gloo's analytics data sources.

# Looker:

#' Connect to Looker via the LookR package.
#' 
#' @param auth_file_location A character. Give the path of the directory where
#' your authenticate file is located. If left blank, R will search for a 
#' file named 'authenticate' in your current working directory. Set to NULL 
#' if you want to enter your credentials manually.
#' @return Connects your R session to the Looker API. No objects are returned.
#' @examples
#' connect_to_looker(auth_file_location="~/authfiles")
#' @export

connect_to_lookr <- function(auth_file_location = 
                               rprojroot::find_root(
                                 rprojroot::has_file('authenticate')
                               )
                              , ...){
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
#' @return A list containing a driver object, drv, and a connection object,
#' con.
#' @examples
#' connect_to_postgres(auth_file_location="~/authfiles")
#' @export

connect_to_postgres <- function(auth_file_location = 
                                  rprojroot::find_root(
                                    rprojroot::has_file('authenticate')
                                  )
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
