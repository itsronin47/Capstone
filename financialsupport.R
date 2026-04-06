library(tidyverse)
library(haven)
library(ggplot2)

# Load data
df <- read_dta("/Users/nabaye/Downloads/clean_data (1).dta")

support_data <- data.frame(
  label = c("Aid programs", "Close family", "Remittances", "Extended family/clan"),
  pct   = c(16.67, 11.79, 9.41, 5.90)
)

support_colors <- c(
  "Aid programs"         = "#1D9E75",
  "Close family"         = "#378ADD",
  "Remittances"          = "#378ADD",
  "Extended family/clan" = "#378ADD"
)

p_support <- ggplot(support_data, aes(x = pct, y = fct_reorder(label, pct), fill = label)) +
  geom_col(width = 0.5) +
  geom_text(aes(label = paste0(round(pct, 1), "%")), hjust = -0.15, size = 4.5, color = "grey30") +
  scale_fill_manual(values = support_colors) +
  scale_x_continuous(limits = c(0, 25)) +
  labs(
    title = "Aid programs are the most common source of financial support,\nbut uptake is low across all sources",
    subtitle = "Share of respondents receiving each source of direct financial support in the past 12 months",
    caption = "Survey data, Adaado, Bosasso, Jowhar, and Marka districts, 2026, n = 882",
    x = NULL, y = NULL
  ) +
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "none",
    plot.title = element_text(size = 15, face = "bold", hjust = 0.5, margin = margin(b = 6)),
    plot.subtitle = element_text(size = 11, color = "grey40", hjust = 0.5, margin = margin(b = 20)),
    plot.caption = element_text(size = 10, color = "grey50", hjust = 0.5, margin = margin(t = 10)),
    axis.text.x = element_blank(),
    axis.text.y = element_text(size = 13),
    panel.grid = element_blank()
  )

print(p_support)

ggsave("support_sources.png", plot = p_support, width = 12, height = 5, dpi = 300)