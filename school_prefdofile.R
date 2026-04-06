library(tidyverse)
library(haven)
library(ggplot2)

# Load data
df <- read_dta("/Users/nabaye/Downloads/clean_data (1).dta")

school_colors <- c(
  "Better"   = "#378ADD",
  "The same" = "#B4B2A9",
  "Worse"    = "#E24B4A"
)

p3 <- df %>%
  filter(!is.na(school_pref)) %>%
  mutate(school_pref_label = case_when(
    as.character(as_factor(school_pref)) == "Better"   ~ "Better",
    as.character(as_factor(school_pref)) == "The same" ~ "The same",
    as.character(as_factor(school_pref)) == "Worse"    ~ "Worse",
    TRUE ~ NA_character_
  )) %>%
  filter(!is.na(school_pref_label)) %>%
  count(school_pref_label) %>%
  mutate(
    pct = n / sum(n) * 100,
    school_pref_label = factor(school_pref_label, levels = c("Better", "The same", "Worse"))
  ) %>%
  ggplot(aes(x = pct, y = fct_rev(school_pref_label), fill = school_pref_label)) +
  geom_col(width = 0.4) +
  geom_text(aes(label = paste0(round(pct, 1), "%")), hjust = -0.15, size = 5, color = "grey30") +
  scale_fill_manual(values = school_colors) +
  scale_x_continuous(limits = c(0, 110)) +
  scale_y_discrete(expand = expansion(mult = c(0.5, 0.5))) +
  labs(
    title = "Strong public support for government takeover of private schools",
    subtitle = "84.5% said the community would be better served; 92.2% said better or the same\nif the district government took over a privately run school",
    caption = "Survey data, Adaado, Bosasso, Jowhar, and Marka districts, 2026, n = 882",
    x = NULL, y = NULL
  ) +
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "none",
    plot.title = element_text(size = 15, face = "bold", hjust = 0.5, margin = margin(b = 6)),
    plot.subtitle = element_text(size = 12, color = "grey40", hjust = 0.5, margin = margin(b = 20)),
    plot.caption = element_text(size = 10, color = "grey50", hjust = 0.5, margin = margin(t = 10)),
    axis.text.x = element_blank(),
    axis.text.y = element_text(size= 13),
    panel.grid = element_blank()
  )

print(p3)

ggsave("school_pref_callout.png", plot = p3, width = 12, height = 6, dpi = 300)