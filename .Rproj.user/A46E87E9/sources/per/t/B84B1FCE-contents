# Simple price vs Searches
p <- ggplot(data=bitcoin_data, aes(x=Searches, y=Price)) +
  geom_point(size=0.5, color="black", alpha=0.15) +
  ggtitle("Price vs Searches") +
  geom_smooth(method='lm', formula= y~x, color="red") +
  stat_poly_eq(formula = y~x, 
               aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")), 
               parse = TRUE) +
  theme_ipsum()

ggsave(p, filename = './images/PriceSearchesCorrelation.png', dpi = 300, 
       type = 'cairo', bg="white",
       width = 8, height = 5, units = 'in')

# Derivative vs Searches
d <- ggplot(data=bitcoin_data, aes(x=Searches, y=Price_MA100_Change_Weekly)) +
  geom_point(size=0.5, color="black", alpha=0.15) +
  ggtitle("Weekly % Change in Bitcoin 100-day MA vs Searches") +
  geom_smooth(method='lm', formula= y~x, color="red") +
  ylab("Weekly % Change in Bitcoin 100-day MA") +
  stat_poly_eq(formula = y~x, 
               aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")), 
               parse = TRUE) +
  theme_ipsum()

ggsave(d, filename = './images/DerivativeSearchesCorrelation.png', dpi = 300, 
       type = 'cairo', bg="white",
       width = 8, height = 5, units = 'in')