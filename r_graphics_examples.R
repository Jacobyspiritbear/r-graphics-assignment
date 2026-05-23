# ============================================================
# R Graphics Examples — Assignment Task 1
# Author: [Your Name]
# Date:   2026-05-23
# Description: Two R graphics examples using Base R and ggplot2
# ============================================================

# ---- Plot 1: Base R Scatter Plot ----
# Dataset: mtcars (built-in)
# Shows: MPG vs. Weight, colored by cylinder count + OLS regression line

png("plot1_base_r.png", width = 800, height = 600, res = 100)

par(mar = c(5, 5, 4, 2), bg = "white")

cols <- c("steelblue", "darkorange", "firebrick")[as.factor(mtcars$cyl)]

plot(mtcars$wt, mtcars$mpg,
     col  = cols,
     pch  = 19,
     cex  = 1.4,
     xlab = "Vehicle Weight (1000 lbs)",
     ylab = "Miles Per Gallon",
     main = "Figure 1: MPG vs. Weight by Cylinder Count\n(Base R — mtcars dataset)",
     cex.main = 1.2,
     cex.lab  = 1.1)

abline(lm(mpg ~ wt, data = mtcars), col = "black", lwd = 2, lty = 2)

legend("topright",
       legend = c("4-cylinder", "6-cylinder", "8-cylinder", "Regression line"),
       col    = c("steelblue", "darkorange", "firebrick", "black"),
       pch    = c(19, 19, 19, NA),
       lty    = c(NA, NA, NA, 2),
       lwd    = c(NA, NA, NA, 2),
       pt.cex = 1.2,
       bty    = "n")

dev.off()
message("Plot 1 saved: plot1_base_r.png")


# ---- Plot 2: ggplot2 Faceted Box Plot ----
# Dataset: diamonds (ggplot2 built-in)
# Shows: Price distribution by color, faceted by cut grade

library(ggplot2)

set.seed(42)
df <- diamonds[sample(nrow(diamonds), 3000), ]

p <- ggplot(df, aes(x = color, y = price, fill = cut)) +
  geom_boxplot(alpha = 0.8, outlier.size = 0.5, outlier.alpha = 0.3) +
  facet_wrap(~cut, nrow = 1) +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title    = "Figure 2: Diamond Price by Color and Cut Grade",
    subtitle = "ggplot2 — diamonds dataset (random sample n = 3,000)",
    x        = "Diamond Color (D = best \u2192 J = worst)",
    y        = "Price (USD)",
    fill     = "Cut Grade"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title     = element_text(face = "bold", size = 13),
    plot.subtitle  = element_text(color = "gray40", size = 10),
    axis.text.x    = element_text(size = 9),
    strip.text     = element_text(face = "bold"),
    legend.position = "none"
  )

ggsave("plot2_ggplot2.png", plot = p, width = 9, height = 6, dpi = 100)
message("Plot 2 saved: plot2_ggplot2.png")

message("All done! Both plots written to working directory.")
