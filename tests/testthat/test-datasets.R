test_that("Valid dataset", {

  expect_error(get_siconv(dataset = "invalid"))
  expect_error(get_siconv(dataset = 1))
  expect_equal(siconv_arqs(NULL), "siconv_programa.csv.zip")
  expect_equal(siconv_arqs("erro"), "Invalid")
  expect_equal(siconv_arqs("programas"), "siconv_programa.csv.zip")
  expect_equal(siconv_arqs("programas_propostas"), "siconv_programa_proposta.csv.zip")
  expect_equal(siconv_arqs("propostas"), "siconv_proposta.csv.zip")
  expect_equal(siconv_arqs("convenios"), "siconv_convenio.csv.zip")
  expect_equal(siconv_arqs("justificativas"), "siconv_justificativas_proposta.csv.zip")
})
