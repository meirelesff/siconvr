#' \pkg{siconvr} is a package designed to extract and clean data on federal targeted
#' transfers in Brazil from SICONV (Sistema de Gestao de Convenios e Contratos de Repasse,
#' in Portuguese).
#'
#' `siconvr` has one main function: `get_siconv()`
#'
#' Under the hoods, this functions takes care of building the URLs for the
#' desired files; downloads, stores, and unzip files' contents; and read
#' the retrieved datasets as fast as possible using `data.tables`' `fread()`.
#'
#' Users can select a wide range of datasets to download: data on proposals
#' submited to the Brazilian Federal Government requesting local investments;
#' details on these proposals; data on accepted projects, their evaluations;
#' and the total amounts transfered.
#'
#' To check the function's documentation page, run `?get_siconv`.
#'
#' @keywords internal
"_PACKAGE"
