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

  type_convert_as_is <- function(x){
    date_pattern <- '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'
    match_date_pattern <- grepl(date_pattern, x)
    all_match_date_pattern <- all(match_date_pattern)
    
    datetime_pattern <- '^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}$' 
    match_datetime_pattern <- grepl(datetime_pattern, x)
    all_match_datetime_pattern <- all(match_datetime_pattern)
   
    if(all_match_date_pattern){
      out <- as.Date(x)
    } else if(all_match_datetime_pattern){
      dates <- substr(x, 1, 10)
      times <- substr(x, 12, 19)
      out <- chron::chron(dates. = dates
                          , times. = times
                          , format = c(dates = 'y-m-d', times = "h:m:s"))
    } else{
      out <- type.convert(x, as.is = T)
    }
    return(out)
  }
  out <-
    lapply(
      look_list
      , FUN = function(x){
        with_factors <- LookR::run_look(x[['look_id']])
        out <- 
          dplyr::mutate_each(
            with_factors
            , dplyr::funs( 
              type_convert_as_is(as.character(.))
          ))
        return(out)       
    })

  setNames(object = out 
           , nm = namevec)

}


