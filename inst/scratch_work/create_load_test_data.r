load_test_1 <- data.frame(
  a = 1:3
  , b = seq(2, 6, by = 2)
)

devtools::use_data(load_test_1, overwrite = T)
write.csv(load_test_1
          , '~/Projects/glootility/inst/csv_test/load_test_1.csv'
          , row.names=F)

load_test_2 <- data.frame(
  a = 1:3
  , c = seq(3, 9, by = 3)
)

devtools::use_data(load_test_2, overwrite = T)
write.csv(load_test_3
          , '~/Projects/glootility/inst/csv_test/load_test_2.csv'
          , row.names=F)


load_test_3 <- data.frame(
  b = seq(2, 6, by = 2)
  , c = seq(3, 9, by = 3)
)

devtools::use_data(load_test_3, overwrite = T)
write.csv(load_test_3
          , '~/Projects/glootility/inst/csv_test/load_test_3.csv'
          , row.names=F)
