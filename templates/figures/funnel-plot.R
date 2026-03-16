# Funnel Plot Template — Scientific Paper Writer
# Requires: R, metafor package
# Install: install.packages("metafor")
# Usage: Rscript funnel-plot.R

library(metafor)

# === MODIFY THIS SECTION WITH YOUR DATA ===
study_data <- data.frame(
  yi = c(-0.23, -0.51, -0.10, -0.35, -0.42, -0.18, -0.55, -0.30, -0.12, -0.40),
  sei = c(0.15, 0.20, 0.12, 0.18, 0.25, 0.14, 0.22, 0.16, 0.11, 0.19)
)
output_file <- "funnel-plot.pdf"
x_label <- "Log Odds Ratio"
# ==========================================

res <- rma(yi = yi, sei = sei, data = study_data, method = "REML")

pdf(output_file, width = 8, height = 6)
funnel(res,
       xlab = x_label,
       main = "Funnel Plot with Pseudo 95% Confidence Limits",
       back = "white",
       shade = "gray90")
dev.off()

# Egger's test for asymmetry
egger <- regtest(res)
cat(sprintf("Funnel plot saved to %s\n", output_file))
cat(sprintf("Egger's test for asymmetry: z = %.3f, p = %.3f\n", egger$zval, egger$pval))
if (egger$pval < 0.10) {
  cat("NOTE: Egger's test suggests potential publication bias (p < 0.10)\n")
} else {
  cat("Egger's test does not suggest significant asymmetry\n")
}
