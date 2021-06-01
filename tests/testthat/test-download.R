test_that("Download functions work", {

  # Needs internet connection
  skip_on_cran()
  skip_if_offline()

  # Download file using internal function
  base_url <- "http://antigo.plataformamaisbrasil.gov.br/images/docs/CGSIS/csv/siconv_consorcios.csv.zip"
  dir.create("download")
  expect_silent(retrieve_siconv(base_url, "download", "teste.zip", FALSE))

  # Read file
  expect_true(file.exists("download/teste.zip"))
  expect_silent(df <- read_siconv("download/teste.zip", "download", "UTF-8"))

  # Test output
  expect_s3_class(df, "data.table")
  unlink("download", force = TRUE, recursive = TRUE)
})
