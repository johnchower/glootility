test_queries <- RJSONIO::fromJSON(
  '~/Projects/glootility/inst/exdata/test_queries.JSON'
)

devtools::use_data(test_queries
                   , test_queries
                   , overwrite = T)

test_looks <- RJSONIO::fromJSON(
  '~/Projects/glootility/inst/exdata/test_looks.JSON'
)

devtools::use_data(test_looks
                   , test_looks
                   , overwrite = T)

