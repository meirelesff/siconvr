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
#' @return `show_schema()` is most usefull for its side effect of downloading,
#' when needed, and opening Plataforma +Brasil's documentation, but is also silently
#' returns a string containing the path to the docs' index file.
#'
#' @note `show_schema()` needs an internet connection to download data in case it
#' does not found a cache folder with the docs from a previous request. Be aware that instability
#' in the Plataforma +Brasil server might produce error messagens, in which case users
#' should try waiting before rerunning the function.
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

    if(!file.exists(docs)) stop("Failed to download Plataforma +Brasil's docs.")
    utils::browseURL(docs)
  }

  return(invisible(docs))
}

