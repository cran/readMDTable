## ----options, include = FALSE-------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 9,
  fig.height = 3
)

## ----save-plot, include = FALSE-----------------------------------------------

save_plot <- function(resp, num) {
  ggplot2::ggsave(
    filename = paste0("vignettes/img/benchmark-", num, ".png"),
    plot     = ggplot2::autoplot(resp),
    width    = 6,
    height   = 2,
    dpi      = 300
  )
}


## ----functions-tested---------------------------------------------------------
library(readMDTable)

test_read_md_table <- function(content) {
  read_md_table(content, show_col_types = FALSE)
}

test_rvest <- function(content) {
  rvest::read_html(content) |> rvest::html_table()
}

## ----benchmark-1, eval = FALSE------------------------------------------------
# mtcars_split_raw_md_url <- "https://raw.githubusercontent.com/jrdnbradford/readMDTable/refs/heads/main/inst/extdata/mtcars-split.md"
# mtcars_split_html_url <- "https://github.com/jrdnbradford/readMDTable/blob/main/inst/extdata/mtcars-split.md"
# 
# resp <- microbenchmark::microbenchmark(
#   test_read_md_table(mtcars_split_raw_md_url),
#   test_rvest(mtcars_split_html_url),
#   times = 100
# )
# 
# ggplot2::autoplot(resp)

## ----benchmark-1-img, out.height = '250px', echo = FALSE, fig.alt = "Violin plot showing that read_md_table is faster than rvest"----
knitr::include_graphics("img/benchmark-1.png")

## ----benchmark-2, eval = FALSE------------------------------------------------
# mtcars_raw_md_url <- "https://raw.githubusercontent.com/jrdnbradford/readMDTable/refs/heads/main/inst/extdata/mtcars.md"
# mtcars_html_url <- "https://github.com/jrdnbradford/readMDTable/blob/main/inst/extdata/mtcars.md"
# 
# resp <- microbenchmark::microbenchmark(
#   test_read_md_table(mtcars_raw_md_url),
#   test_rvest(mtcars_html_url),
#   times = 100
# )
# 
# ggplot2::autoplot(resp)

## ----benchmark-2-img, out.height = '250px', echo = FALSE, fig.alt = "Violin plot showing that read_md_table is faster than rvest"----
knitr::include_graphics("img/benchmark-2.png")

## ----benchmark-3, eval = FALSE------------------------------------------------
# mtcars_raw_md_file <- readr::read_file(mtcars_split_raw_md_url)
# mtcars_html_file <- readr::read_file(mtcars_split_html_url)
# 
# resp <- microbenchmark::microbenchmark(
#   test_read_md_table(mtcars_raw_md_file),
#   test_rvest(mtcars_html_file),
#   times = 100
# )
# 
# ggplot2::autoplot(resp)

## ----benchmark-3-img, out.height = '250px', echo = FALSE, fig.alt = "Violin plot showing that rvest is faster than read_md_table"----
knitr::include_graphics("img/benchmark-3.png")

## ----benchmark-4, eval = FALSE------------------------------------------------
# raw_md <- readr::read_file(mtcars_raw_md_url)
# html <- readr::read_file(mtcars_html_url)
# 
# resp <- microbenchmark::microbenchmark(
#   test_read_md_table(raw_md),
#   test_rvest(html),
#   times = 100
# )
# 
# ggplot2::autoplot(resp)

## ----benchmark-4-img, out.height = '250px', echo = FALSE, fig.alt = "Violin plot showing that rvest is slighlty faster than read_md_table"----
knitr::include_graphics("img/benchmark-4.png")

