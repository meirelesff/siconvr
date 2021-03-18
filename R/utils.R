# Function to get archives' names
siconv_arqs <- function(dataset){

  if(is.null(dataset)) return("siconv_programa.csv.zip")
  dplyr::case_when(

    dataset == "programs" ~ "siconv_programa.csv.zip",
    dataset == "proposals" ~"siconv_programa_proposta.csv.zip",
    TRUE ~ "Invalid"
  )
}

# Funcion to handle GET requests, unzip files, and read data
retrieve_siconv <- function(link, dest_folder, arq, verbose){

  dest_file <- file.path(dest_folder, arq)

  if(verbose){
    siconv_url <- "http://plataformamaisbrasil.gov.br/"
    cli::cli_alert_info("Downloading files from {.url {siconv_url}}")
    x <- httr::GET(link, httr::write_disk(dest_file, overwrite = TRUE), httr::progress("down"))
  }
  else{
    x <- httr::GET(link, httr::write_disk(dest_file, overwrite = TRUE))
  }

  # Status
  httr::stop_for_status(x, task = "download files from Siconv. Try again later")

  # Return destfile path
  dest_file
}


# Funcion to unzip and read siconv data
read_siconv <- function(dest_file, dest_folder, encoding){

  # Unzip
  unz_arq <- utils::unzip(dest_file, exdir = dest_folder)

  # Returns
  res <- data.table::fread(unz_arq, fill = T, encoding = encoding)
  file.remove(unz_arq)
  return(res)
}





