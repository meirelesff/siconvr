#' Retrieve cleaned data from SICONV
#'
#' `get_siconv()` is the package's workhorse. It downloads, cleans, and
#' returns one of the several datasets maintained by SICONV on federal
#' targeted transfers in Brazil. Under the hoods, the function handles GET requests,
#' downloads and stores intermediary files, and reads as fast as possible the data
#' to a [tibble][tibble::tibble-package] format convenient for use in analysis.
#' 
#' @param dataset A `string` indicating the dataset to retrieve. Valid options:
#' 
#' * "programs" -- data on available programs maintained by the Federal Government;
#' * "proposals" -- data on submited proposals to the Federal Government;
#' 
#' When not specified, `dataset` defaults to "programs".
#' 
#' @param encoding Encoding used to read raw files. Defaults to "UTF-8", but users
#' might need to change this option to other valid options (e.g., "latin1") if
#' data are returned with uncommon characters.
#' 
#' @param cache Should the function maintain a local copy of the data? To save
#' both time and SICONV's server resources, this defaults to `TRUE`.
#' 
#' @export
#' @examples 
#' \dontrun{df <- get_siconv(dataset = "proposals")}

get_siconv <- function(dataset = NULL, encoding = "UTF-8", cache = TRUE){
  
  # Inputs
  if(!is.logical(cache)) stop("'cache' must be logical.")

  # URLs
  base_url <- "http://plataformamaisbrasil.gov.br/images/docs/CGSIS/csv/"
  arq <- siconv_arqs(dataset)
  if(arq == "Invalid") stop("Invalid 'dataset' argument. Please, check the documentation and try again.")
  link <- paste0(base_url, arq)
  
  # Download
  temp_dir <- tempdir()
  temp <- paste0(temp_dir, "/", arq)
  x <- httr::GET(url, httr::write_disk(temp, overwrite = TRUE), httr::progress("down"))
  
  # Status
  httr::stop_for_status(x, task = "download files from Siconv. Try again later")
  
  # Read
  res <- data.table::fread(utils::unzip(temp, exdir = temp_dir), fill = T, encoding = encoding)
  unlink(temp_dir, recursive = TRUE)
  
  # Return
  return(res)
}
