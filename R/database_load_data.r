# Tools for loading data from Gloo's databases

#' Run a list of queries specified by a list, and save the results in a list of
#' data frames.
#'
#' @param query_list A list of (query_name, query) pairs.
#'  See gloograph::test_queries for an example of how to format this list.
#' @param connection The production database's PostgreSQL connection object.
#' @return A named list of data frames, one for each (query_name, query) pair.

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
