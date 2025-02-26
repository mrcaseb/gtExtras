
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gtExtras

<!-- badges: start -->
<!-- badges: end -->

The goal of gtExtras is to provide some additional helper functions to
assist in creating beautiful tables with `{gt}`

## Installation

You can install the dev version of gtExtras from
[GitHub](https://github.com/jthomasmock/gtExtra) with:

``` r
remotes::install_github("jthomasmock/gtExtras")
```

### `fmt_symbol_first`

This function allows you to format your columns only on the first row,
where remaining rows in that column have whitespace added to the end to
maintain proper alignment.

``` r
library(gtExtras)
library(gt)

gtcars %>%
  head() %>%
  dplyr::select(mfr, year, bdy_style, mpg_h, hp) %>%
  dplyr::mutate(mpg_h = rnorm(n = dplyr::n(), mean = 22, sd = 1)) %>%
  gt::gt() %>%
  gt::opt_table_lines() %>%
  fmt_symbol_first(column = mfr, symbol = "&#x24;", suffix = " ", last_row_n = 6) %>%
  fmt_symbol_first(column = year, symbol = NULL, suffix = "%", last_row_n = 6) %>%
  fmt_symbol_first(column = mpg_h, symbol = "&#37;", suffix = NULL, last_row_n = 6, decimals = 1) %>%
  fmt_symbol_first(column = hp, symbol = "&#176;", suffix = "F", last_row_n = 6, decimals = NULL, symbol_first = TRUE)
```

<p align="center">
<img src="man/figures/gt_fmt_first.png" width="700px">
</p>

### `pad_fn`

You can use `pad_fn()` with `gt::fmt()` to pad specific columns that
contain numeric values. You will use it when you want to “decimal align”
the values in the column, but not require printing extra trailing
zeroes.

``` r
data.frame(x = c(1.2345, 12.345, 123.45, 1234.5, 12345)) %>%
  gt() %>%
  fmt(fns = function(x){pad_fn(x, nsmall = 4)}) %>%
  tab_style(
    # MUST USE A MONO-SPACED FONT
    style = cell_text(font = google_font("Fira Mono")),
    locations = cells_body(columns = x)
    )
```

<p align="center">
<img src="man/figures/gt_pad_fn.png" width="200px">
</p>

### Themes

The package includes two different themes, the `gt_theme_538()` styled
after FiveThirtyEight style tables, and `gt_theme_espn()` styled after
ESPN style tables.

``` r
head(mtcars) %>%
  gt() %>% 
  gt_theme_538()
```

<p align="center">
<img src="man/figures/gt_538.png" width="700px">
</p>

``` r
head(mtcars) %>%
  gt() %>% 
  gt_theme_538()
```

<p align="center">
<img src="man/figures/gt_espn.png" width="700px">
</p>

### Hulk data_color

This is an opinionated diverging color palette. It diverges from low to
high as purple to green. It is a good alternative to a red-green
diverging palette as a color-blind friendly palette. The specific colors
come from
[colorbrewer2](https://colorbrewer2.org/#type=diverging&scheme=PRGn&n=7).

Basic usage below, where a specific column is passed.

``` r
# basic use
head(mtcars) %>%
  gt::gt() %>%
  gt_hulk_color(mpg)
```

<p align="center">
<img src="man/figures/hulk_basic.png" width="700px">
</p>

Trim provides a tighter range of purple/green so the colors are less
pronounced.

``` r
head(mtcars) %>%
  gt::gt() %>%
  # trim gives smaller range of colors
  # so the green and purples are not as dark
  gt_hulk_color(mpg:disp, trim = TRUE) 
```

<p align="center">
<img src="man/figures/hulk_trim.png" width="700px">
</p>

<!-- width="1200px" -->

Reverse makes higher values represented by purple and lower by green.
The default is to have high = green, low = purple.

``` r
# option to reverse the color palette
# so that purple is higher
head(mtcars) %>%
  gt::gt() %>%
  # reverse = green for low, purple for high
  gt_hulk_color(mpg:disp, reverse = FALSE) 
```

<p align="center">
<img src="man/figures/hulk_reverse.png" width="700px">
</p>
