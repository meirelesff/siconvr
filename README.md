
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

| Option                   | Data                                                                                                                   |
|:-------------------------|:-----------------------------------------------------------------------------------------------------------------------|
| `programas`              | data on available programs maintained by the Federal Government                                                        |
| `programas_propostas`    | keys to match programs and proposals submited to the Federal Government                                                |
| `propostas`              | data on proposals submited to the Federal Government                                                                   |
| `convenios`              | data on proposals effectivelly signed by the Federal Governments                                                       |
| `emendas`                | data on amendments to the the federal budget made by Brazilian Federal Deputies and Senators to fund federal transfers |
| `planos`                 | data on application plans submited to the Federal Government                                                           |
| `empenhos`               | data on transfers appropriated in the Federal Budget                                                                   |
| `desembolsos`            | data on transfers disbursements by the Federal Government                                                              |
| `obtv`                   | data on payments made to local suppliers and contractors hired to execute funded projects                              |
| `historico`              | proposals’ track record                                                                                                |
| `ingresso_contrapartida` | record of counterpart payments                                                                                         |
| `aditivos`               | data on contracts’ budget addendums                                                                                    |
| `crono_metas`            | cronogram of project’s goals                                                                                           |
| `cronogramas`            | project’s execution cronograms                                                                                         |
| `consorcios`             | data on proposals where multiple local governments or private entities cooperate to request federal resources          |
| `empenhos_desembolsos`   | keys to match appropriations and disbursements by Federal Government                                                   |
| `proponentes`            | data on proposals’ proponents                                                                                          |
| `cronograma_desembolsos` | cronogram of project’s transfers disbursements                                                                         |
| `justificativas`         | proposals’ justifications                                                                                              |

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

## Contributions

We welcome suggestions to improve `siconvr`. In case you wish to
contribute with code, feel free to push commits to this repository – we
will be more than happy to acknowledge any assistance by updating our
contributors’ list.

## Authors

[Fernando Meireles](https://fmeireles.com) e [Marcus Vinícius de Sá
Torres](http://marcustorresz.github.io/)
