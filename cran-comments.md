## Resubmission

Thanks for the review. This time we improved the documentation by adding \value 
to main functions, as well as two \note alerting users they need internet connection 
to download data.

## Test environments

* Ubuntu 20.04 (personal computer), R 4.0.5
* Ubuntu 16.04.6 LTS (R 4.0.2), using Travis-ci
* GitHub Actions - (ubuntu-20.04): release, devel
* GitHub Actions - (windows-latest): release
* GitHub Actions - (macOS-latest): release
* Win-builder (release and devel)

## R CMD check results

0 errors | 0 warnings | 1 note

* There's a note suggesting the title case form of the title field to be set as "Plataforma +brasil". 
We use instead "Plataforma +Brasil" since that is the data provider's name.

* There's a note on winbuilder regarding a possibly misspelled word, "Plataforma +Brasil",
which is the data provider's name.

## Reverse dependencies

This is a new release, there are no reverse dependencies.
