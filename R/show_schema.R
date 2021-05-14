#' Access Plataforma +Brasil's documentation
#'
#' `show_schema()` downloads, unzips, and show in a web browser Plataforma +Brasil's
#' full database documentation, including its schema and other usefull information.
#' Docs are downloaded to a folder in the working directory.
#'
#' @param verbose Should the function display messages and progress bar? Defaults
#' to `TRUE`.
#'
#' @param browser Should the function open a web browser to display the docs?
#' Defaults to `TRUE`.
#'
#' @export
#' @examples
#' \dontrun{show_schema()}

show_schema <- function(verbose = TRUE, browser = TRUE){

  # Inputs
  if(!is.logical(verbose)) stop("'verbose' must be logical.")

  # URL, file, folder
  link <- "http://plataformamaisbrasil.gov.br/images/docs/CGSIS/modelo_dados_siconv.zip"
  dest_folder <- "siconvr_docs"
  arq <- "siconvr_docs.zip"
  docs <- file.path(dest_folder, "/Modelo BD Portal/", "index.html")

  # Downloads the docs if not available
  if(!file.exists(file.path(dest_folder, arq))){

    if(!dir.exists(dest_folder)) dir.create(dest_folder)
    dest_file <- retrieve_siconv(link, dest_folder, arq, verbose)
    utils::unzip(dest_file, exdir = dest_folder)
  }

  # Display them in the users' browser
  if(browser) {

    if(!file.exists(docs)) stop("Failed to download Plataforma +Brasil docs.")
    utils::browseURL(docs)
  }

  return(invisible(docs))
}

