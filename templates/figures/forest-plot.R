# Forest Plot Template — Scientific Paper Writer
# Requires: R, metafor package
# Install: install.packages("metafor")
# Usage: Rscript forest-plot.R

library(metafor)

# === MODIFY THIS SECTION WITH YOUR DATA ===
study_data <- data.frame(
  study = c("Smith 2020", "Jones 2021", "Lee 2022"),
  yi = c(-0.23, -0.51, -0.10),   # log(OR) or log(RR)
  sei = c(0.15, 0.20, 0.12)       # standard error
)
output_file <- "forest-plot.pdf"
x_label <- "Odds Ratio"
# ==========================================

res <- rma(yi = yi, sei = sei, data = study_data, method = "REML")

pdf(output_file, width = 10, height = max(4, nrow(study_data) * 0.5 + 2))
forest(res,
       slab = study_data$study,
       xlab = x_label,
       atransf = exp,
       at = log(c(0.25, 0.5, 1, 2, 4)),
       header = TRUE,
       mlab = "Pooled Estimate (Random-Effects, REML)")
dev.off()

cat(sprintf("Forest plot saved to %s\n", output_file))
cat(sprintf("Pooled estimate: %.3f (95%% CI: %.3f, %.3f)\n",
            exp(res$beta), exp(res$ci.lb), exp(res$ci.ub)))
cat(sprintf("Heterogeneity: I² = %.1f%%, tau² = %.4f, Q(df=%d) = %.2f, p = %.3f\n",
            res$I2, res$tau2, res$k - 1, res$QE, res$QEp))
