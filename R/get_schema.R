#' Access Plataforma +Brasil's documentation
#'
#' `show_schema()` downloads, unzips, and show in a web browser Plataforma +Brasil's
#' full database documentation, including its schema and other usefull information.
#' Docs are downloaded to a folder in the working directory.
#'
#' @param verbose Should the function display messages and progress bar? Defaults
#' to `TRUE`.
#'
#' @export
#' @examples
#' \dontrun{show_schema()}

show_schema <- function(verbose = TRUE){

  # Inputs
  if(!is.logical(verbose)) stop("'verbose' must be logical.")

  # URLs
  link <- "http://plataformamaisbrasil.gov.br/images/docs/CGSIS/modelo_dados_siconv.zip"
  arq <- "siconvr_docs.zip"

  # Downloads the docs if not available
  if(!file.exists(file.path("siconvr_docs", arq))){

    dest_folder <- "siconvr_docs"
    if(!dir.exists("siconvr_docs")) dir.create("siconvr_docs")
    dest_file <- retrieve_siconv(link, dest_folder, arq, verbose)
    utils::unzip(dest_file, exdir = dest_folder)
    utils::browseURL(paste0(dest_folder, "/Modelo BD Portal/", "index.html"))
  }

  # If docs are available, display them in the users' browser
  else {

    utils::browseURL(paste0(dest_folder, "/Modelo BD Portal/", "index.html"))
  }
}

