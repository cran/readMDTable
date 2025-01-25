## ----options, include = FALSE-------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 9,
  fig.height = 3
)

## ----functions-tested---------------------------------------------------------
library(readMDTable)

test_extract_md_tables <- function(content) {
  extract_md_tables(content, show_col_types = FALSE)
}

test_read_md_table <- function(content) {
  read_md_table(content, show_col_types = FALSE)
}

test_rvest <- function(content) {
  rvest::read_html(content) |> rvest::html_table()
}

## ----benchmark-1, fig.alt = "Violin plot showing that extract_md_tables is faster than rvest"----
mtcars_split_raw_md_url <- "https://raw.githubusercontent.com/jrdnbradford/readMDTable/refs/heads/main/inst/extdata/mtcars-split.md"
mtcars_split_html_url <- "https://github.com/jrdnbradford/readMDTable/blob/main/inst/extdata/mtcars-split.md"

resp <- microbenchmark::microbenchmark(
  test_extract_md_tables(mtcars_split_raw_md_url),
  test_rvest(mtcars_split_html_url),
  times = 20
)

ggplot2::autoplot(resp)

## ----benchmark-2, fig.alt = "Violin plot showing that read_md_table is faster than rvest"----
mtcars_raw_md_url <- "https://raw.githubusercontent.com/jrdnbradford/readMDTable/refs/heads/main/inst/extdata/mtcars.md"
mtcars_html_url <- "https://github.com/jrdnbradford/readMDTable/blob/main/inst/extdata/mtcars.md"

resp <- microbenchmark::microbenchmark(
  test_read_md_table(mtcars_raw_md_url),
  test_rvest(mtcars_html_url),
  times = 20
)

ggplot2::autoplot(resp)

## ----benchmark-3, fig.alt = "Violin plot showing that rvest is faster than extract_md_tables"----
mtcars_raw_md_file <- readr::read_file(mtcars_split_raw_md_url)
mtcars_html_file <- readr::read_file(mtcars_split_html_url)

resp <- microbenchmark::microbenchmark(
  test_extract_md_tables(mtcars_raw_md_file),
  test_rvest(mtcars_html_file),
  times = 100
)

ggplot2::autoplot(resp)

## ----benchmark-4, fig.alt = "Violin plot showing that rvest is slighlty faster than read_md_table"----
raw_md <- readr::read_file(mtcars_raw_md_url)
html <- readr::read_file(mtcars_html_url)

resp <- microbenchmark::microbenchmark(
  test_read_md_table(raw_md),
  test_rvest(html),
  times = 100
)

ggplot2::autoplot(resp)

