library(tidycensus)
library(tidyverse)
options(tigris_use_cache = TRUE)
v17 <- load_variables(2017, "acs5", cache = TRUE)
# View(v17)

carteret_income_df <- get_acs(
  state = "NC", county = "Carteret", geography = "tract",
  variables = "B19013_001", geometry = TRUE
)

carteret_income <- carteret_income_df %>%
  ggplot(aes(fill = estimate)) +
  geom_sf(color = NA) +
  coord_sf(crs = 26911) +
  scale_fill_viridis_c(
    option = "D",
    label = scales::dollar_format(),
    direction = -1,
    trans = "reverse"
  ) +
  labs(
    title = "Median household income in Carteret County, North Carolina",
    subtitle = "2015-2019 ACS for Census Tracts",
    fill = NULL
  ) +
  theme_void() +
  theme(legend.key.height = unit(30, "pt"))

carteret_income

carteret_tree_df <- carteret_income_df %>%
  mutate(tree = if_else(grepl("9710.02|9703.04", NAME), "Tree City USA", "Nope"))

carteret_tree <- carteret_tree_df %>%
  ggplot(aes(fill = fct_rev(tree))) +
  geom_sf(color = NA) +
  coord_sf(crs = 26911) +
  scale_fill_manual(values = c("#778868", "#f6edbd")) +
  labs(
    title = "Tree Cities in Carteret County, North Carolina",
    subtitle = "2015-2019 ACS for Census Tracts",
    fill = NULL
  ) +
  theme_void()

ggsave("figs/carteret-tree.png", carteret_tree, height = 4, width = 5)

fig
d <- diamonds[sample(nrow(diamonds), 1000), ]

p <- ggplot(data = d, aes(x = carat, y = price)) +
  geom_point(aes(text = paste("Clarity:", clarity)), size = 4) +
  geom_smooth(aes(colour = cut, fill = cut)) + facet_wrap(~ cut)

fig <- ggplotly(p)

fig

carteret_age <- get_acs(
  state = "NC", county = "Carteret", geography = "tract",
  variables = "B01002_001", geometry = TRUE
) %>%
  ggplot(aes(fill = estimate)) +
  geom_sf(color = NA) +
  coord_sf(crs = 26911) +
  scale_fill_viridis_c(
    option = "D",
    direction = -1,
    trans = "reverse"
  ) +
  labs(
    title = "Median age in Carteret County, North Carolina",
    subtitle = "2015-2019 ACS for Census Tracts",
    fill = NULL
  ) +
  theme_void() +
  theme(legend.key.height = unit(30, "pt"))
carteret_age
ggsave("figs/carteret_age.png", carteret_age, height = 4, width = 4.5)
