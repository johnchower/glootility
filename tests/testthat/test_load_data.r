# root_dir <- rprojroot::find_root(rprojroot::has_dirname('glootility'))
root_dir <- '/Users/johnhower/Projects/glootility'
test_that("load_data.r works", {
  expected_1 <- glootility::load_test_1
  expected_2 <- glootility::load_test_2
  expected_3 <- glootility::load_test_3
  load_and_name_csvs_from_directory( 
    path = paste(root_dir, "inst/csv_test", sep = "/")
    , env = globalenv()
  )

  testthat::expect_equal(object = calculated_result_1
                         , expected = expected_1)
  testthat::expect_equal(object = calculated_result_2
                         , expected = expected_2)
  testthat::expect_equal(object = calculated_result_3
                         , expected = expected_3)
})
