# siconvr

<!-- badges: start -->
  [![CRAN status](https://www.r-pkg.org/badges/version/siconvr)](https://CRAN.R-project.org/package=siconvr)
  [![R-CMD-check](https://github.com/meirelesff/siconvr/workflows/R-CMD-check/badge.svg)](https://github.com/meirelesff/siconvr/actions)
 [![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

`siconvr` is an R package designed to extract and clean data on federal targeted transfers in Brazil from SICONV (Sistema de Gestao de Convenios e Contratos de Repasse, in Portuguese).


## Installing

To install the development version of the package, use:

```r
if(!require(remotes)) install.packages("remotes")
remotes::install_github("meirelesff/siconvr")
```

## How to use

Toy example:

```r
library(siconvr)

progs <- get_siconv("programs")
```



