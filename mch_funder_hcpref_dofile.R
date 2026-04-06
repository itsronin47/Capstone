library(tidyverse)
library(haven)
library(ggplot2)
install.packages("patchwork")
library(patchwork)

# Load data
df <- read_dta("/Users/nabaye/Downloads/clean_data (1).dta")

# --- Panel 1: MCH Funder ---
funder_colors <- c(
  "Government"              = "#378ADD",
  "NGO / Aid agency"        = "#1D9E75",
  "Private owner"           = "#E24B4A",
  "Don't know/ No response" = "#B4B2A9"
)

# --- Panel 2: Health Clinic Preference ---
pref_colors <- c(
  "District govt clinic" = "#378ADD",
  "Private clinic"       = "#E24B4A"
)

p1 <- df %>%
  filter(!is.na(mch_funder)) %>%
  mutate(mch_funder_label = case_when(
    as.numeric(mch_funder) %in% c(1, 2, 3) ~ "Government",
    as.numeric(mch_funder) %in% c(4, 5)    ~ "NGO / Aid agency",
    as.numeric(mch_funder) == 6             ~ "Private owner",
    as.numeric(mch_funder) == 99            ~ "Don't know/ No response",
    TRUE ~ NA_character_
  )) %>%
  filter(!is.na(mch_funder_label)) %>%
  count(mch_funder_label) %>%
  mutate(pct = n / sum(n) * 100) %>%
  ggplot(aes(x = pct, y = fct_reorder(mch_funder_label, pct), fill = mch_funder_label)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct, 1), "%")), hjust = -0.15, size = 3.2, color = "grey30") +
  scale_fill_manual(values = funder_colors) +
  scale_x_continuous(limits = c(0, 65), labels = function(x) paste0(x)) +
  labs(
    title = "Who funds the nearest MCH center?",
    subtitle = "n = 882 respondents",
    x = NULL, y = NULL
  ) +
  theme_minimal(base_size = 12) +
  theme(
    legend.position = "none",
    plot.title = element_text(size = 12, face = "bold"),
    plot.subtitle = element_text(size = 10, color = "grey50"),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank()
  )

# --- Panel 2: Health Clinic Preference ---

pref_colors <- c(
  "District govt clinic" = "#AFA9EC",
  "Private clinic"       = "#F09595"
)

p2 <- df %>%
  filter(!is.na(hc_pref)) %>%
  mutate(hc_pref_label = case_when(
    as.numeric(hc_pref) == 1 ~ "Private clinic",
    as.numeric(hc_pref) == 2 ~ "District govt clinic",
    TRUE ~ NA_character_
  )) %>%
  filter(!is.na(hc_pref_label)) %>%
  count(hc_pref_label) %>%
  mutate(pct = n / sum(n) * 100) %>%
  ggplot(aes(x = pct, y = fct_reorder(hc_pref_label, pct), fill = hc_pref_label)) +
  geom_col(width = 0.5) +
  geom_text(aes(label = paste0(round(pct, 1), "%")), hjust = -0.15, size = 4, color = "grey30") +
  annotate("text", x = 40, y = 1.6,
    label = "72.5% of NGO-perceivers\nstill prefer a govt clinic",
    size = 3.8, color = "grey30", hjust = 0, lineheight = 1.3) +
  scale_fill_manual(values = pref_colors) +
  scale_x_continuous(limits = c(0, 100), labels = function(x) paste0(x)) +
  labs(
    title = "Which clinic would you trust more?",
    subtitle = "Both 2 km away, immunizations free",
    x = NULL, y = NULL
  ) +
  theme_minimal(base_size = 12) +
  theme(
    legend.position = "none",
    plot.title = element_text(size = 12, face = "bold"),
    plot.subtitle = element_text(size = 10, color = "grey50"),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank()
  )

# --- Combine panels ---
p1 + p2 +
  plot_annotation(
    title = "MCH centers are predominantly NGO-funded, yet most respondents prefer government-run care",
    caption = "Survey data, Adaado, Bosasso, Jowhar, and Marka districts, 2026, n = 882",
    theme = theme(
      plot.title = element_text(size = 15, face = "bold", hjust = 0.5, margin = margin(b = 10)),
      plot.caption = element_text(size = 10, color = "grey50", hjust = 0.5, margin = margin(t = 10))
    )
  )

# --- Save ---
ggsave("mch_figure.png", width = 12, height = 5, dpi = 300)