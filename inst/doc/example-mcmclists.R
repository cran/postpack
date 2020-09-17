## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, fig.align = "center")

## ---- eval = FALSE------------------------------------------------------------
#  data(cjs)
#  data(cjs_no_rho)

## ---- echo = FALSE------------------------------------------------------------
load("../data/cjs.rda")
load("../data/cjs_no_rho.rda")

## -----------------------------------------------------------------------------
postpack::post_dim(cjs)

## -----------------------------------------------------------------------------
postpack::get_params(cjs, type = "base_index")

