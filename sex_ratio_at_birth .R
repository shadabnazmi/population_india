pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png', 
               'grid', 'ggpubr', 'scales',
               'bbplot2','reshape2')

sratio_data <- read.csv("sex_ratio_at_birth.csv")



plot_sratio <- ggplot(sratio_data, aes(x = Year, y = natural.ratio)) + 
  geom_line(size =1, colour = "#1380a1")+
  geom_point(colour = "#1380a1")+
  scale_y_continuous(expand = c(0,0), limits = c(100, 115))+
  geom_hline(yintercept = 105, size = 1, colour = "#333333",  alpha = 0.50)+
  reith_style()+
  labs(title = "India's sex ratio at birth is\nimproving", subtitle = "Number of male births per 1000 female births")
plot_sratio

finalise_plot(plot_name = plot_sratio,
              source = "Source: Census of India, NFHS (2015-16)",
              save_filepath = "sratio-nc.png",
              width_pixels = 690,
              height_pixels = 400)