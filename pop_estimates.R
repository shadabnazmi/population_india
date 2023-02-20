pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png', 
               'grid', 'ggpubr', 'scales',
               'bbplot2','reshape2')

variant_population <- read.csv("Variant_population_2.csv")%>%
  pivot_longer(cols = 2:last_col(), names_to = "type", values_to = "value")
variant_population



plot_vpop <- ggplot(data = variant_population, aes(x = Year, y = value, colour = type)) + 
  geom_line(size = 1)+
  scale_color_manual(values = c( "#1380A1","#990000","#588300","#FAAB18"))+
  scale_y_continuous(expand = c(0,0), limits = c(0, 2500000))+
  reith_style()+
  labs(title = "India's sex ratio at birth is\nimproving", subtitle = "Number of male births per 1000 female births")
plot_vpop

vplot <-plot_vpop+geom_rect(
  xmin = 2022, xmax = 2100, ymin = -Inf, ymax = Inf,
  fill = "#FAAB18", alpha = 0.1
)

vplot

finalise_plot(plot_name = plot_vpop,
              source = "Source: Census of India, NFHS (2015-16)",
              save_filepath = "vpop-nc.png",
              width_pixels = 690,
              height_pixels = 550)