# Function to get archives' names
siconv_arqs <- function(dataset){

  if(is.null(dataset)) return("siconv_programa.csv.zip")

  if(dataset == "programas") return("siconv_programa.csv.zip")
  else if(dataset == "programas_propostas") return("siconv_programa_proposta.csv.zip")
  else if(dataset == "propostas") return("siconv_proposta.csv.zip")
  else if(dataset == "pagamento") return("siconv_pagamento.csv.zip")
  else if(dataset == "convenios") return("siconv_convenio.csv.zip")
  else if(dataset == "emendas") return("siconv_emenda.csv.zip")
  else if(dataset == "planos") return("siconv_plano_aplicacao.csv.zip")
  else if(dataset == "empenhos") return("siconv_empenho.csv.zip")
  else if(dataset == "desembolsos") return("siconv_desembolso.csv.zip")
  else if(dataset == "obtv") return("siconv_obtv_convenente.csv.zip")
  else if(dataset == "historico") return("siconv_historico_situacao.csv.zip")
  else if(dataset == "ingresso_contrapartida") return("siconv_ingresso_contrapartida.csv.zip")
  else if(dataset == "aditivos") return("siconv_termo_aditivo.csv.zip")
  else if(dataset == "crono_metas") return("siconv_meta_crono_fisico.csv.zip")
  else if(dataset == "cronogramas") return("siconv_etapa_crono_fisico.csv.zip")
  else if(dataset == "consorcios") return("siconv_consorcios.csv.zip")
  else if(dataset == "empenhos_desembolsos") return("siconv_empenho_desembolso.csv.zip")
  else if(dataset == "proponentes") return("siconv_proponentes.csv.zip")
  else if(dataset == "cronograma_desembolsos") return("siconv_cronograma_desembolso.csv.zip")
  else if(dataset == "justificativas") return("siconv_justificativas_proposta.csv.zip")
#New datasets added in 2022
  else if(dataset == "historico_projeto_basico") return("siconv_historico_projeto_basico.csv.zip")
  else if(dataset == "desbloqueio_cr") return("siconv_desbloqueio_cr.csv.zip")
  else if(dataset == "licitacao") return("siconv_licitacao.csv.zip")
  else if(dataset == "prorroga_oficio") return("siconv_prorroga_oficio.csv.zip")
  else if(dataset == "termo_aditivo") return("siconv_termo_aditivo.csv.zip")
#Those are also part of the 2022 group, but they are more than one in an only zip.
    #1. siconv_acomp_obras_mod_empresas.csv.zip            (2 csvs)
    #2. siconv_inst_cont_aio_mod_empresas.csv.zip         (3 csvs)
    #3. siconv_projeto_basico_mod_empresas.csv.zip        (5csvs)
    #4. siconv_vrpl_mod_empresas.csv.zip                   (3 csvs)
    
  else return("Invalid")
}

# Funcion to handle GET requests, unzip files, and read data
retrieve_siconv <- function(link, dest_folder, arq, verbose){

  dest_file <- file.path(dest_folder, arq)

  if(verbose){
    siconv_url <- "https://repositorio.dados.gov.br/seges/detru/"
    cli::cli_alert_info("Downloading files from {.url {siconv_url}}")
    x <- httr::GET(link, httr::write_disk(dest_file, overwrite = TRUE),
                   httr::progress("down"))
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
  res <- data.table::fread(unz_arq, fill = TRUE, encoding = encoding,
                           verbose = FALSE, integer64 = "numeric",
                           showProgress = FALSE)
  file.remove(unz_arq)
  return(res)
}

