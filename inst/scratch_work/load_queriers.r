proj_root <- rprojroot::find_root(rprojroot::has_dirname('glootility'))

path_to_query <- 'inst/queries/pa_flash_cat.sql'
full_path_to_query <- paste(proj_root, path_to_query, sep = '/')
query_pa_flash_cat <- readLines(con = full_path_to_query)
query_pa_flash_cat <- paste(query_pa_flash_cat, collapse=" ")

devtools::use_data(query_pa_flash_cat
                   , overwrite = T
                   , pkg = proj_root)
