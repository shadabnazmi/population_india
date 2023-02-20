pacman::p_load('dplyr', 'tidyr',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png', 
               'grid', 'ggpubr', 'scales',
               'bbplot2','reshape2')

fert <- read.csv("fertility_rate.csv")%>%
  pivot_longer(cols = 2:last_col(), names_to = "type", values_to = "value")%>%
  filter(type == "Muslims" | type == "Hindus" | type == "Christians" | type == "Buddhists" | type == "Sikhs" | type == "Jains")
fert


plot_vpop <- ggplot(data = fert, aes(x = Year, y = value, fill = type)) + 
  geom_area(alpha = 0.10)+
  geom_line(aes(x= Year, y = value, colour = type), size = 1)+
  geom_point(aes(x= Year, y = value, colour = type))+
  facet_wrap(~type, ncol = 3,)+
  coord_cartesian(clip = "off")+
  scale_fill_manual(values = c( "#1380A1","#990000","#588300","#FAAB18", "#555555", "#aa4a04", "#565554"))+
  scale_colour_manual(values = c( "#1380A1","#990000","#588300","#FAAB18", "#555555", "#aa4a04", "#565554"))+
  scale_y_continuous(expand = c(0,0), limits = c(0, 4.99))+
  scale_x_continuous(expand = c(0,0))+
  reith_style()+
  all_reith_underneath()+
  geom_text(aes(label = value, colour = type, size = 2, fill = "white"), vjust = -1)+
  labs(title = "Fertility rate is declining in all religious groups")
plot_vpop

plot_vvop <- plot_vpop +theme(legend.position = "none")+ theme(panel.spacing.x = ggplot2::unit(25, 'pt'))

finalise_plot(plot_name = plot_vvop,
             source = "Source: NFHS (1992-2019)",
             save_filepath = "fert-nc.png",
             width_pixels = 690,
             height_pixels = 490)

