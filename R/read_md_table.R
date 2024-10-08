#' @title Read a Markdown Table into a Tibble
#'
#' @details `read_md_table` reads a markdown table into a tibble from a string,
#'   file, or URL. It uses [`readr::read_delim`] to efficiently read in data.
#'
#'   `read_md_table` expects `file` to be a markdown table.  If `file` is a
#'   markdown file that contains more than just a table or tables, the table(s)
#'   should be extracted with [`readMDTable::extract_md_tables`] before reading
#'   them in.
#'
#'   If `warn` is `TRUE`, `read_md_table` will warn if there are potential
#'   issues with the provided markdown table. Depending on the issue,
#'   `read_md_table` may still correctly read the table. For instance, if the
#'   row separating the header from the other rows is malformed or any rows
#'   have missing leading or trailing pipes, warnings will be raised but the
#'   data will be read correctly. [`readr::read_delim`] will provide its own
#'   warnings if there are potential issues.
#'
#' @param file Either a path to a file, a connection, or literal data (either
#'   a single string or a raw vector). Files starting with `http://`,
#'   `https://`, `ftp://`, or `ftps://` will be automatically downloaded.
#'
#' @param warn Boolean. Should warnings be raised about possible issues with
#'   the passed `file`? Defaults to `TRUE`.
#'
#' @inheritDotParams readr::read_delim -trim_ws -delim
#'
#' @returns A tibble created from the markdown table.
#'
#' @examples
#' # Read from a file
#' read_md_table(read_md_table_example("mtcars.md"))
#'
#' # Read from a string
#' read_md_table("| H1 | H2 | \n|-----|-----|\n| R1C1 | R1C2 |\n| R2C1 | R2C2 |")
#'
#' \donttest{
#' # Read from a URL
#' read_md_table(
#'   "https://raw.githubusercontent.com/jrdnbradford/readMDTable/main/inst/extdata/iris.md"
#' )
#' }
#'
#' # Get warnings for malformed tables
#' read_md_table(
#'   "| Name  | Age | City        | Date       |
#'    |-------|-----|-------------|------------|
#'    | Alice | 30  | New York    | 2021/01/08 |
#'    | Bob   | 25  | Los Angeles | 2023/07/22 |
#'      Carol | 27  | Chicago     | 2022/11/01  "
#' )
#' @export
read_md_table <- function(file, warn = TRUE, ...) {
  content <- source_file(file)
  read_md_table_content(content, warn = warn, ...)
}
