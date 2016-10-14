# Tools for loading data from Gloo's databases

#' Run a list of queries and save the results in a list of
#' data frames.
#'
#' @param query_list A list of (query_name, query) pairs.
#'  See gloograph::test_queries for an example of how to format this list.
#' @param connection The production database's PostgreSQL connection object.
#' @return A named list of data frames, one for each (query_name, query) pair.
#' @export

run_query_list <- function(query_list
                           , connection = con){

  namevec <- 
    unlist(
      lapply(
        query_list
        , FUN = function(x){
          x[['query_name']]
      })
    )

  out <-
    lapply(
      query_list
      , FUN = function(x){
        DBI::dbGetQuery(connection, x[['query']])
    })

  setNames(object = out 
           , nm = namevec)
}

#' Run a list of looks and save the results in a list of
#' data frames.
#'
#' @param look_list A list of (look_name, look_id) pairs.
#'  See gloograph::test_looks for an example of how to format this list.
#' @return A named list of data frames, one for each (look_name, look_id) pair.
#' @export

run_look_list <- function(look_list){

  namevec <- 
    unlist(
      lapply(
        look_list
        , FUN = function(x){
          x[['look_name']]
      })
    )

  out <-
    lapply(
      look_list
      , FUN = function(x){
        LookR::run_look(x[['look_id']])
    })

  setNames(object = out 
           , nm = namevec)

}
