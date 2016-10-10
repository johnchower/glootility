test_that("load_data.r works", {
  expected_1 <- glootility::load_test_1
  expected_2 <- glootility::load_test_2
  expected_3 <- glootility::load_test_3
  root_dir <- rprojroot::find_root(
    rprojroot::has_file(
      'DESCRIPTION'
    ))
  load_and_name_csvs_from_directory( 
    path = paste(root_dir, "csv_test", sep = "/")
    , env = globalenv()
  )

  expected_1 == calculated_result_1 &
  expected_2 == calculated_result_2 &
  expected_3 == calculated_result_3 
})
