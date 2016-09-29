# This folder contains tools for loading csv data into memory

#' Load all csv files from a given directory.
#'
#' @param csv_path A character specifying a directory where csv files are
#' located.
#' @return A list of data frames, one for each csv file in csv_path.

load_csv_from_directory <- function(csv_path){
  "Hello"
}

#' Loop through a list of data frames, and assign each to a name in a specified
#' environment, .GlobalEnv by default. The names are specified in a JSON file
#' which lives in the same directory as the csv fil
#'
#' @param df_list A list of data frames.
#' @param name_list A list of key-value pairs of the form list(list(col.names =
#' c("name1", "name2"), assigned_name = "out_name"), list(col.names =
#' c("name3"), assigned_name = "out_name2")). Such lists are generated from
#' JSON files (see example_name_list.JSON).
#' @param env An environment in which to store the names and data frames
#' specified by name_list. Defaults to .GlobalEnv.
#' @return Alters the global environment, doesn't return any object.

assign_by_colnames <- function(df_list
                               , name_list
                               , env = .GlobalEnv){
  "Hello"
})
