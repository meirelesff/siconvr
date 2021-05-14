test_that("Valid inputs", {

  expect_error(get_siconv(verbose = "true"))
  expect_error(get_siconv(cache = 32))
  expect_error(show_schema(verbose = "false"))
})
