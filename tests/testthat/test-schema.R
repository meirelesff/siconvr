test_that("Function to show schema works", {

  # Needs internet
  skip_on_cran()
  skip_if_offline()

  # Download the docs and return
  expect_silent(x <- show_schema(verbose = FALSE, browser = FALSE))
  expect_type(x, "character")
  unlink("siconvr_docs", force = TRUE, recursive = TRUE)
})
