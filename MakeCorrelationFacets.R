bitcoin_rename <- bitcoin_data %>% rename( # Change names of columns for easier reading
  `Price 30-day MA`=Price_MA30,
  `Price 100-day MA`=Price_MA100,
  `Price 100-day MA %Change`=Price_MA100_Change_Weekly,
  `Searches 30-day MA`=Search_MA30,
  `Searches 100-day MA`=Search_MA100,
  `Searches 100-day MA %Change`=Search_MA100_Change_Weekly
)

bitcoin_melt <- bitcoin_rename %>% pivot_longer( # Melt data for facets
  c("Price", "Price 30-day MA", "Price 100-day MA", 
    "Price 100-day MA %Change"),
  names_to="Price_type",
  values_to="Price"
  ) %>% pivot_longer(
    c("Searches", "Searches 30-day MA", "Searches 100-day MA",
      "Searches 100-day MA %Change"),
    names_to="Search_type",
    values_to="Searches"
  )

p <- ggplot(data=bitcoin_melt, aes(x=Searches, y=Price)) + 
  geom_point(size=0.1, alpha=0.2, color="grey") +
  facet_grid(cols=vars(Search_type), rows=vars(Price_type), scales="free") +
  geom_smooth(method="lm", color="red", size=0.2) +
  stat_cor(aes(label = ..rr.label..), color = "red", geom = "text", size=3) +
  theme_ipsum() +
  ggtitle("Correlation of Search and Price metrics") +
  ylab("") +
  xlab("") +
  theme(panel.spacing= unit(0.5, "lines"), 
        panel.border = element_rect(color = "grey", fill = NA, size = 0.2))

ggsave(p, filename = './images/CorrelationFacets.png', dpi = 300, type = 'cairo', bg="white",
       width = 13, height = 8, units = 'in')
