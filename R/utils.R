# Function to get archives' names
siconv_arqs <- function(dataset){

  dplyr::case_when(

    is.null(dataset) ~ "siconv_programa.csv.zip",
    dataset == "programs" ~ "siconv_programa.csv.zip",
    dataset == "proposals" ~"siconv_programa_proposta.csv.zip",
    TRUE ~ "Invalid"
  )
}









