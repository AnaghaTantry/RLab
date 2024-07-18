library(ggplot2)
library(plotly)
library(dplyr)
titanic <- read.csv("C:/Users/HP/OneDrive/Desktop/4th sem/R/train.csv")
data<- na.omit(titanic)
titanic$Survived <- factor(titanic$Survived, levels = c("0","1"))
bar_chart <- ggplot(titanic, aes(x = factor(Pclass), fill = factor(Survived)))+
  geom_bar(position = "dodge")+
  labs(title = "Survivers of titanic by Passenger Class",
       x = "Passenger Class",
       y = "Count",
       fill = "Survived")+
  scale_fill_manual(values = c("0"="maroon","1"="black"))
line_plot <- ggplot(titanic, aes(x = Age, y = ..density..))+
  geom_density(fill = "maroon", alpha = 0.5)+
  labs(title = "Age Distribution in titanic",
       x = "Age",
       y = "Density")
scatter_plot <- ggplot(titanic, aes(x= Age, y = Fare, color = factor(Survived)))+
  geom_point()+
  labs(title = "Fare vs Age",
       x = "Age",
       y = "Fare",
       color= "Survived")+
  scale_color_manual(values = c("0"="maroon", "1" = "black"))
heatmap <- ggplot(titanic, aes(x = Pclass, y = Survived))+
  stat_bin_2d(bins = 10, aes(fill = ..count..))+
  labs(title = "Titanic Survival Heatmap", x = "Pclass", y = "Survived", fill = "Frequency")+
  scale_fill_continuous(name = "Frequency", low = "white", high = "maroon")+
  theme_minimal()
interactive_bar_chart <- ggplotly(bar_chart)
interactive_line_plot <- ggplotly(line_plot)
interactive_scatter_plot <- ggplotly(scatter_plot)
interactive_heatmap_plot <- ggplotly(heatmap)
ggsave("bar_plot.png", plot = bar_chart, width = 8, height = 6)
ggsave("line_plot.png", plot = line_plot, width = 8, height = 6)
ggsave("scatter_plot.png", plot = scatter_plot, width = 8, height = 6)
ggsave("titanic_heatmap_ggplot.png", heatmap, width = 8, height = 6)
htmlwidgets::saveWidget(interactive_bar_chart, "interactive_bar_chart.html", selfcontained = TRUE)
htmlwidgets::saveWidget(interactive_line_plot, "interactive_line_plot.html", selfcontained = TRUE)
htmlwidgets::saveWidget(interactive_scatter_plot, "interactive_scatter_plot.html", selfcontained = TRUE)
htmlwidgets::saveWidget(interactive_heatmap_plot, file = "titanic_heatmap.html") 
