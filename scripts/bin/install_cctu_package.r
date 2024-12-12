# #No commonet out #!/usr/bin/env r
#
# A second example to install one or more packages, now with option parsing
#
# Copyright (C) 2011 - 2014  Dirk Eddelbuettel
# Copyright (C) 2014 - 2017  Carl Boettiger and Dirk Eddelbuettel
# Copyright (C) 2018 - 2023  Carl Boettiger, Dirk Eddelbuettel, Brandon Bertelsen, and SHIMA Tatsuya
#
# Released under GPL (>= 2)

## load docopt package from CRAN
#library(docopt)
#opt <- docopt("Usage: install_cctu_package.r [R_VERSION]")

args <-  commandArgs(TRUE)

message( "R_VERSION parameter = ", args)


.get_github_commit_date <- function(commit_url) {
  commit_date <- httr::GET(commit_url, httr::add_headers(accept = "application/vnd.github.v3+json")) |>
    httr::content() |>
    purrr::pluck("commit", "committer", "date", .default = NA) |>
    as.Date()
  
  commit_date
}

message("pull cctu version history")

# df_cctu <- gert::git_remote_ls(remote = "https://github.com/cam-ctu/cctu.git")|>
#   dplyr::filter(stringr::str_detect(ref, "^refs/tags/[vV]?")) |>
#   dplyr::mutate(
#     cctu_version = stringr::str_extract(ref, r"([vV]?\d+\.\d+\.\d+.{0,1}\d*.*)"),
#     commit_url = glue::glue("https://api.github.com/repos/cam-ctu/cctu/commits/{oid}"),
#     .keep = "none"
#   ) |>
#   dplyr::slice_tail(n = 10) |>
#   dplyr::rowwise() |>
#   dplyr::mutate(cctu_commit_date = .get_github_commit_date(commit_url)) |>
#   dplyr::ungroup() |>
#   tidyr::drop_na() |>
#   dplyr::select(
#     cctu_version,
#     cctu_commit_date
#   ) |>
#   dplyr::arrange(cctu_commit_date)

message("compare to rversion history")

df_args <- read.csv("build/args/history.tsv",sep="\t",
                    colClasses=c("character","Date","character","Date","character")
                    )

message("do the matching")

# df_args <- df_args|>
#   tidyr::expand_grid(df_cctu)|>
#   dplyr::filter( cctu_commit_date< r_freeze_date | is.na(r_freeze_date))|>
#   dplyr::group_by(r_version) |>
#   dplyr::slice_max(cctu_commit_date, with_ties = FALSE) |>
#   dplyr::ungroup()
# 
# cctu_version <- df_args |>
#   dplyr::filter(r_version==args[1]) |>
#   dplyr::pull(cctu_version)

cctu_version <- "0.8.1"
message("Installing cctu version ", cctu_version)


remotes::install_github(repo="cam-ctu/cctu", ref=cctu_version, INSTALL_opts="--install-tests" , build_vignettes=TRUE)
