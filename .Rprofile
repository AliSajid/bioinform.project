if (interactive()) {
  if (file.exists("~/.Rprofile")) {
    source("~/.Rprofile")
  }
}

source("renv/activate.R")
options(vsc.rstudioapi = TRUE) #added by `renvsc`
if (interactive() && Sys.getenv('TERM_PROGRAM') == 'vscode') {
  if ('httpgd' %in% .packages(all.available = TRUE)) {
    options(vsc.plot = FALSE)
    options(device = function(...) {
      httpgd::hgd(silent = TRUE)
      .vsc.browser(httpgd::hgd_url(), viewer = 'Beside')
    })
  }
} #added by `renvsc`
options(vsc.rstudioapi = TRUE) #added by `renvsc`
if (interactive() && Sys.getenv('TERM_PROGRAM') == 'vscode') {
  if ('httpgd' %in% .packages(all.available = TRUE)) {
    options(vsc.plot = FALSE)
    options(device = function(...) {
      httpgd::hgd(silent = TRUE)
      .vsc.browser(httpgd::hgd_url(), viewer = 'Beside')
    })
  }
} #added by `renvsc`
options(vsc.rstudioapi = TRUE) #added by `renvsc`
if (interactive() && Sys.getenv('TERM_PROGRAM') == 'vscode') {
  if ('httpgd' %in% .packages(all.available = TRUE)) {
    options(vsc.plot = FALSE)
    options(device = function(...) {
      httpgd::hgd(silent = TRUE)
      .vsc.browser(httpgd::hgd_url(), viewer = 'Beside')
    })
  }
} #added by `renvsc`
