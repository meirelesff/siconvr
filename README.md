
<!-- README.md is generated from README.Rmd. Please edit that file -->

# siconvr

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/siconvr)](https://CRAN.R-project.org/package=siconvr)
[![R-CMD-check](https://github.com/meirelesff/siconvr/workflows/R-CMD-check/badge.svg)](https://github.com/meirelesff/siconvr/actions)
[![Codecov test
coverage](https://codecov.io/gh/meirelesff/siconvr/branch/main/graph/badge.svg)](https://codecov.io/gh/meirelesff/siconvr?branch=main)
[![Travis build
status](https://travis-ci.com/meirelesff/siconvr.svg?branch=main)](https://travis-ci.com/meirelesff/siconvr)
<!-- badges: end -->

`siconvr` is an R package designed to fetch and clean data on federal
targeted transfers in Brazil from Plataforma +Brasil (previously
SICONV). With `siconvr`, obtaining data on available policy programs
maintained by the Brazilian Federal Government, proposals submitted by
local governments, and NGOs to apply for such funds, among many others,
takes a few seconds.

## Installing

Install the package from CRAN using:

``` r
install.packages("siconvr")
```

To install the package’s development version, use:

``` r
if(!require(remotes)) install.packages("remotes")
remotes::install_github("meirelesff/siconvr")
```

Then load it with:

``` r
library(siconvr)
```

## How to use

Using `siconvr` to fetch data from Plataforma +Brasil is easy: pass the
type of data you want to the `get_siconv` function and you are ready to
go. Here’s an example:

``` r
progs <- get_siconv("programas")
```

### Available datasets

Here a list of available datasets one can fetch using `siconvr`:

| Option                   | Data                                                                                                                                                                   |
|:-------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `programas`              | data on available programs maintained by the Federal Government                                                                                                        |
| `programas_propostas`    | keys to match programs and proposals submitted to the Federal Government                                                                                               |
| `propostas`              | data on proposals submitted to the Federal Government                                                                                                                  |
| `convenios`              | data on proposals effectively accepted situation and amount transferred by the Federal Government                                                                      |
| `emendas`                | data on federal budget amendments made by Brazilian Federal Deputies and Senators, amount transferred and the transference recipient;                                  |
| `planos`                 | data on application plans submitted to the Federal Government. This document includes all goods, services and works required by the covenant to accomplish the project |
| `empenhos`               | data on transfers which the Federal Government has reserved its budget to pay the covenant when the project ends                                                       |
| `desembolsos`            | data on transfers disbursements by the Federal Government                                                                                                              |
| `obtv`                   | data on payments made to local suppliers and contractors hired to execute funded projects                                                                              |
| `historico`              | proposals’ track record                                                                                                                                                |
| `ingresso_contrapartida` | record of counterpart payments                                                                                                                                         |
| `aditivos`               | data on contracts’ budget addendums                                                                                                                                    |
| `crono_metas`            | project’s goals timeline                                                                                                                                               |
| `cronogramas`            | project’s execution timeline                                                                                                                                           |
| `consorcios`             | data on proposals where multiple local governments or private entities cooperate to request federal resources                                                          |
| `empenhos_desembolsos`   | keys to match appropriations and disbursements by Federal Government                                                                                                   |
| `proponentes`            | data on proposals’ proponents                                                                                                                                          |
| `cronograma_desembolsos` | project’s transfers disbursements timeline                                                                                                                             |
| `justificativas`         | proposals’ justifications                                                                                                                                              |

### Schema

It also possible to check Plataforma +Brasil’s database official
documentation – which includes the database diagram and schema,
additional information on tables and variables, primary keys, among
others – by using this:

``` r
show_schema()
```

`show_schema` will extract, read, and open in a web browser the
database’s docs. Files are saved in the working directory, so one
doesn’t need to download them again (to just download the docs, set the
argument `browser` to `FALSE`).

### Options

By default, `get_siconv` tries to read fetched data using `UTF-8`
encoding. In case this does not work for you, use the argument
`encoding` to change that:

``` r
emp <- get_siconv("empenhos", encoding = "latin-1")
```

To save Plataforma +Brasil server resources, `get_siconv` stores a cache
of fetched data in a folder in working directory named `cache` – so you
don’t need to download the same data again. To avoid cacheing date, set
`cache` to `FALSE`:

``` r
obtv <- get_siconv("obtv", cache = FALSE)
```

Finally, one might also want to avoid `get_siconv`’s messages when
fetching data. This can be done with:

``` r
historico <- get_siconv("historico", verbose = FALSE)
```

## Contributing

We welcome any help to improve `siconvr`. In case you wish to contribute
with code, use [GitHub Pull
Requests](https://docs.github.com/pt/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)
– we will be more than happy to acknowledge any assistance by updating
our authors’ list. Bug reports and suggestions can be done via [GitHub
issues](https://github.com/meirelesff/siconvr/issues).

## Disclaimer

`siconvr` does not maintain or update Plataforma +Brasil’s database, nor
does it change or alter fetched data. Therefore, the authors hold no
responsability for its uses or results.

In case you want to dive deeper into Plataforma +Brasil’s sources and
update policy, please check the following official sources:

-   [Official website](http://plataformamaisbrasil.gov.br/)

-   [SICONV’s working
    plan](https://static.fecam.net.br/uploads/1542/arquivos/1302090_MODULO_A_SICONV_6_PLANO_DE_TRABALHO.pdf)

-   [Guide for Delivering
    Programs](http://plataformamaisbrasil.gov.br/images/Disponibilizacao_de_Programas.pdf)

-   [Financial
    Guide](http://plataformamaisbrasil.gov.br/images/manuais/M%C3%B3dulo_Fundo_a_Fundo/Tranfer%C3%AAncia/3_Manual_de_Cadastro_de_Conta_Banc%C3%A1ria_e_Empenho_-_Repassador_-_Transfer%C3%AAncia.pdf)

## Authors

[Fernando Meireles](https://fmeireles.com/) e [Marcus Vinícius de Sá
Torres](https://marcustorresz.github.io/)
