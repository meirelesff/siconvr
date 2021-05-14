test_that("Dataframes are downloaded as expected", {

  skip_on_cran()
  expect_silent(proponentes <- get_siconv("proponentes", verbose = FALSE, cache = FALSE))
  expect_s3_class(proponentes, "tbl_df")
  expect_s3_class(proponentes, "tbl")
  expect_type(proponentes$IDENTIF_PROPONENTE, "character")
})
