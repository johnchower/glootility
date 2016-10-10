# This folder contains tools for loading csv data into memory

#' Load all csv files in a given directory, and assign them names in a given
#' environment (.GlobalEnv by defaul)
#'
#' @param path The location of the directory to be loaded.
#' @return Alters the global environment, doesn't return any object.
#' @export

load_and_name_csvs_from_directory <- function(path, ...){
  df_list <- load_csv_from_directory(path)
  name_list <- load_name_list_from_directory(path)
  assign_by_colnames_2(df_list
                       , name_list
                       , ...)
}

#' Load all csv files from a given directory.
#'
#' @param csv_path A character specifying a directory where csv files are
#' located.
#' @return A list of data frames, one for each csv file in csv_path.

load_csv_from_directory <- function(csv_path){
  csv_list <- dir(csv_path)
  csv_list <- grep(pattern = '.csv$', x = csv_list, value = T)
  csv_list <- as.list(csv_list)

  lapply(csv_list
         , FUN = function(file){
    read.csv(file, stringsAsFactors = F)
  })
}

#' Load a name list from a given directory.
#'
#' @param name_list_path A character vector specifying a directory where the
#' name list is located.
#' @return a list of lists that can be used in the assign_by_colnames
#' functions.

load_name_list_from_directory <- function(name_list_path){
  path <- dir(name_list_path)
  name_list <- grep(pattern = '.JSON$', x = path, value = T)
  RJSONIO::fromJSON(name_list)
}

#' Given a list of data frames, and a list of (col.name, assigned_name) pairs,
#' loop through both and assign each data frame to the assigned_name that
#' matches its column names.
#' 
#' @param df_list A list of data frames
#' @param name_list A list of key-value pairs of the form list(list(col.names =
#' c("name1", "name2"), assigned_name = "out_name"), list(col.names =
#' c("name3"), assigned_name = "out_name2")). Such lists are generated from
#' JSON files (see example_name_list.JSON).
#' @return Alters the global environment, doesn't return any object.

assign_by_colnames_2 <- function(df_list
                               , name_list
                               , ...){
  lapply(
    df_list
    , FUN = function(df)assign_by_colnames_1(df, name_list, ...)
  )
}

#' Read the column names of a data frame.
#' If they match a target, then assign that data frame to a given
#' variable name.
#'
#' @param df a data frame
#' @param col.names a character vector
#' @param assigned_name The name that df will be assigned in env if its
#' column names match col.names
#' @return Alters the global environment, doesn't return any object.

#' Given a data frame, loop through a list of (col.name, assigned_name) pairs,
#' If the column names match col.name, assign the data frame to the
#' corresponding assigned_name.
#'
#' @param df A data frame.
#' @param name_list A list of key-value pairs of the form list(list(col.names =
#' c("name1", "name2"), assigned_name = "out_name"), list(col.names =
#' c("name3"), assigned_name = "out_name2")). Such lists are generated from
#' JSON files (see example_name_list.JSON).
#' @return Alters the global environment, doesn't return any object.

assign_by_colnames_1 <- function(df
                               , name_list
                               , ...){
  lapply(
    name.list
    , FUN = function(x)assign_by_colnames_0(df
                                            , x$col.names
                                            , x$assigned_name
                                            , ...)
  )
}

assign_by_colnames_0 <- function(df
                                 , col.names
                                 , assigned_name
                                 , env = globalenv()){
  diff1 <- length(dplyr::setdiff(col.names, colnames(df)))
  diff2 <- length(dplyr::setdiff(colnames(df), col.names))
  if(diff1 == 0 & diff2 == 0){
      assign(assigned_name, df, envir = env)
    }
}

