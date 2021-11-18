bitcoin_data_normalized <- bitcoin_data %>% mutate_at(
  c("Price", "Price_MA30", "Price_MA100", "Price_MA100_Change_Weekly",
    "Searches", "Search_MA30", "Search_MA100", "Search_MA100_Change_Weekly"),
  ~(scale(.) %>% as.vector)
)

bitcoin_rename_values <- bitcoin_data_normalized %>% rename( # Change names of columns for easier reading
  `Price 30-day MA`=Price_MA30,
  `Price 100-day MA`=Price_MA100,
  `Price 100-day MA %Change`=Price_MA100_Change_Weekly,
  `Searches 30-day MA`=Search_MA30,
  `Searches 100-day MA`=Search_MA100,
  `Searches 100-day MA %Change`=Search_MA100_Change_Weekly
)

bitcoin_price_values <- bitcoin_rename_values %>% pivot_longer( # Melt data for facets
  c("Price", "Price 30-day MA", "Price 100-day MA", 
    "Price 100-day MA %Change"),
  names_to="Price_type",
  values_to="Price"
) 

bitcoin_search_values <- bitcoin_rename_values %>% pivot_longer(
  c("Searches", "Searches 30-day MA", "Searches 100-day MA",
    "Searches 100-day MA %Change"),
  names_to="Search_type",
  values_to="Searches"
)

p <- ggplot() + 
  facet_grid(cols=vars(Search_type), rows=vars(Price_type), scales="free") +
  geom_line(data=bitcoin_price_values, 
            aes(x=Date, y=Price, color="Price"), size=0.2, alpha=0.6, show.legend=TRUE) +
  geom_line(data=bitcoin_search_values, 
            aes(x=Date, y=Searches, color="Searches"), size=0.2, alpha=0.6, show.legend=TRUE) +
  theme_ipsum() +
  scale_color_manual(name="",values=c("red", "black")) +
  ylab("") +
  xlab("") +
  ggtitle("Searches and Price metrics (normalized)") +
  theme(panel.spacing= unit(0.5, "lines"), 
        panel.border = element_rect(color = "grey", fill = NA, size = 0.2))

ggsave(p, filename = './images/ValueFacets.png', dpi = 300, type = 'cairo', bg="white",
       width = 14, height = 8, units = 'in')
