#' Fetch cleaned data from Plataforma +Brasil
#'
#' `get_siconv()` is the package's workhorse. It downloads, cleans, and
#' returns one of the several datasets maintained by Plataforma +Brasil on federal
#' targeted transfers in Brazil. Under the hoods, the function handles GET requests,
#' downloads and stores intermediary files, and reads as fast as possible the data
#' to a `tibble` format convenient for use in analysis.
#'
#' @param dataset A `string` indicating the dataset to retrieve. Valid options:
#'
#' * "programas" -- data on available programs maintained by the Federal Government;
#' * "programas_propostas" -- keys to match programs and proposals submitted to the Federal Government;
#' * "propostas" -- data on proposals submitted to the Federal Government;
#' * "convenios" -- data on proposals effectively accepted situation and amount transferred by the Federal Government;
#' * "emendas" -- data on federal budget amendments made by Brazilian Federal Deputies and Senators, amount transferred and the transference recipient;
#' * "planos" -- data on application plans submitted to the Federal Government. This document includes all goods, services and works required
#'    by the covenant to accomplish the project;
#' * "empenhos" -- data on transfers which the Federal Government has reserved its budget to pay the covenant when the project ends;
#' * "desembolsos" -- data on transfers disbursements by the Federal Government;
#' * "obtv" -- data on payments made to local suppliers and contractors hired to execute funded projects;
#' * "historico" -- proposals' track record;
#' * "ingresso_contrapartida" -- record of counterpart payments;
#' * "aditivos" -- data on contracts' budget addendum;
#' * "crono_metas" -- project's goals timeline;
#' * "cronogramas" -- project's execution timeline;
#' * "consorcios" -- data on proposals where multiple local governments or private entities cooperate to request federal resources;
#' * "empenhos_desembolsos" -- keys to match appropriations and disbursements by Federal Government;
#' * "proponentes" -- data on proposals' proponents;
#' * "cronograma_desembolsos" -- project's transfers disbursements timeline;
#' * "justificativas" -- proposals' justifications;
#'
#' When not specified, `dataset` defaults to "programas".
#'
#' @param encoding Encoding used to read raw files. Defaults to "UTF-8", but users
#' might need to change this option to other valid options (e.g., "latin1") if
#' data are returned with uncommon characters.
#'
#' @param cache Should the function maintain a local copy of the data? To save
#' both time and SICONV's server resources, this defaults to `TRUE`. Data is
#' stored as a zipfile in the foleer "cache" in the working directory (avoid
#' changing files' names inside this folder).
#'
#' @param verbose Should the function display messages and progress bar? Defaults
#' to `TRUE`.
#'
#' @note `get_siconv()` needs an internet connection to download data in case it
#' does not found a cache folder with raw data from a previous request. Be aware that instability
#' in the Plataforma +Brasil server might produce error messagens, in which case users
#' should try waiting before rerunning their requests.
#'
#'
#' @return A \link[tibble]{tibble} contantaining the requested data as defined in the
#' `dataset` argument. Use the \code{\link{show_schema}} function to get detailed information
#' on available variables and information.
#'
#' @export
#' @examples
#' \dontrun{df <- get_siconv(dataset = "propostas")}

get_siconv <- function(dataset = NULL, encoding = "UTF-8", cache = TRUE, verbose = TRUE){

  # Inputs
  if(!is.logical(verbose)) stop("'verbose' must be logical.")
  if(!is.logical(cache)) stop("'cache' must be logical.")

  # URLs
  base_url <- "http://plataformamaisbrasil.gov.br/images/docs/CGSIS/csv/"
  arq <- siconv_arqs(dataset)
  if(arq == "Invalid") stop("Invalid 'dataset' argument. Please, check the documentation and try again.")
  link <- paste0(base_url, arq)

  # Perform actions based on 'cache'
  if(cache & !file.exists(file.path("cache", arq))){

    dest_folder <- "cache"
    if(!dir.exists("cache")) dir.create("cache")
    dest_file <- retrieve_siconv(link, dest_folder, arq, verbose)
    res <- read_siconv(dest_file, dest_folder, encoding)
  }
  else if(cache & file.exists(file.path("cache", arq))){

    if(verbose) cli::cli_alert_info("Retrieving data from cache")
    dest_folder <- "cache"
    dest_file <- file.path(dest_folder, arq)
    res <- read_siconv(dest_file, dest_folder, encoding)
  }
  else if(!cache){

    dest_folder <- tempfile()
    if (!dir.create(dest_folder)) stop("Failed to create a temporary directory. Try using 'cache = TRUE'")
    dest_file <- retrieve_siconv(link, dest_folder, arq, verbose)
    res <- read_siconv(dest_file, dest_folder, encoding)
    unlink(dest_folder, force = TRUE, recursive = TRUE)
  }

  # Return
  return(tibble::as_tibble(res))
}

