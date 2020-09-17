## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, fig.align = "center")

## ---- eval = FALSE------------------------------------------------------------
#  library(postpack)
#  data(cjs)
#  data(cjs_no_rho)

## ---- echo = FALSE------------------------------------------------------------
library(postpack)
load("../data/cjs.rda")
load("../data/cjs_no_rho.rda")

## -----------------------------------------------------------------------------
post_list = list(cjs, cjs_no_rho)

## -----------------------------------------------------------------------------
names(post_list) = c("est_rho", "no_rho")

## -----------------------------------------------------------------------------
sapply(post_list, post_dim)

## -----------------------------------------------------------------------------
sapply(post_list, get_params, type = "base_index")

## -----------------------------------------------------------------------------
sapply(post_list, function(model) post_summ(model, "", Rhat = TRUE)["Rhat",])

## -----------------------------------------------------------------------------
lapply(post_list, function(model) post_summ(model, "^B", digits = 2))

## -----------------------------------------------------------------------------
lapply(post_list, function(model) post_summ(model, "p", digits = 2))

## ---- message = FALSE---------------------------------------------------------
lapply(post_list, function(model) {
  SIG_decomp = vcov_decomp(model, "SIG")
  rho_mean = post_summ(SIG_decomp, "rho")["mean",]
  array_format(rho_mean)
})

## -----------------------------------------------------------------------------
lapply(post_list, function(model) {
  # 2SDs below average length, average length, and 2SDs above average length
  # model was fitted with length scaled and centered
  pred_length = c(-2,0,2)  

  # extract posterior mean of random coefficients
  b0_mean = post_summ(model, "b0")["mean",]
  b1_mean = post_summ(model, "b1")["mean",]

  # predict survival each year from coefficients at each length
  pred_phi = sapply(1:5, function(y) {
    logit_phi = b0_mean[y] + b1_mean[y] * pred_length
    phi = exp(logit_phi)/(1 + exp(logit_phi))
    round(phi, 2)
  })
  
  # give dimension names
  dimnames(pred_phi) = list(c("small", "average", "large"), paste0("y", 1:5))
  
  # return the predicted survival
  return(pred_phi)
})


