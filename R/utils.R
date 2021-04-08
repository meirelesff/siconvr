# Function to get archives' names
siconv_arqs <- function(dataset){

  if(is.null(dataset)) return("siconv_programa.csv.zip")
  dplyr::case_when(

    dataset == "programas" ~ "siconv_programa.csv.zip",
    dataset == "programas_propostas" ~ "siconv_programa_proposta.csv.zip",
    dataset == "propostas" ~ "siconv_proposta.csv.zip",
    dataset == "convenios" ~ "siconv_convenio.csv.zip",
    dataset == "emendas" ~ "siconv_emenda.csv.zip",
    dataset == "planos" ~ "siconv_plano_aplicacao.csv.zip",
    dataset == "empenhos" ~ "siconv_empenho.csv.zip",
    dataset == "desembolsos" ~ "siconv_desembolso.csv.zip",
    dataset == "obtv" ~ "siconv_obtv_convenente.csv.zip",
    dataset == "historico" ~ "siconv_historico_situacao.csv.zip",
    dataset == "ingresso_contrapartida" ~ "siconv_ingresso_contrapartida.csv.zip",
    dataset == "aditivos" ~ "siconv_termo_aditivo.csv.zip",
    dataset == "crono_metas" ~ "siconv_meta_crono_fisico.csv.zip",
    dataset == "cronogramas" ~ "siconv_etapa_crono_fisico.csv.zip",
    dataset == "consorcios" ~ "siconv_consorcios.csv.zip",
    dataset == "empenhos_desembolsos" ~ "siconv_empenho_desembolso.csv.zip",
    dataset == "proponentes" ~ "siconv_proponentes.csv.zip",
    dataset == "cronograma_desembolsos" ~ "siconv_cronograma_desembolso.csv.zip",
    dataset == "justificativas" ~ "siconv_justificativas_proposta.csv.zip",
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





