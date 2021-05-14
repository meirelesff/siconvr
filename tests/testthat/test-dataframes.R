test_that("Dataframes are downloaded as expected", {

  # Needs internet connection
  skip_on_cran()
  skip_if_offline()

  # Download
  expect_silent(cons <- get_siconv("consorcios", verbose = FALSE))

  # Read from cache
  expect_true(dir.exists("cache"))
  cons <- get_siconv("consorcios", cache = TRUE, verbose = FALSE)
  unlink("cache", force = TRUE, recursive = TRUE)
})

test_that("Downloaded dataframes behave as expected", {

  # Needs internet connection
  skip_on_cran()
  skip_if_offline()

  # Download data
  expect_silent(cons <- get_siconv("consorcios", verbose = FALSE, cache = FALSE))

  # Test output
  expect_s3_class(cons, "tbl_df")
  expect_s3_class(cons, "tbl")
  expect_type(cons$ID_PROPOSTA, "integer")
  expect_type(cons$NOME_CONSORCIO, "character")
})

