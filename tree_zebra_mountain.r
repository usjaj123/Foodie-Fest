#1 Library
library(reshape2)

#2 Download Foodie data
foodie_data <- read.csv("FoodieFest_Data.csv")

#3 Create function to prepare the data for analysis 
prepare_data <- function(data){
  #a) Remove unnecessary columns
  foodie_data_new <- subset(foodie_data, select=-c(Attendees, Resturant, Cuisine, Status))

  #b) Melt data into long format
  foodie_data_melted <- melt(data, id.vars = c("Date", "City"), variable.name = "Foodie_Type")
  
  #c) Sum the melted data by city and type
  foodie_data_summed <- aggregate(foodie_data_melted$value, list(foodie_data_melted$City, foodie_data_melted$Foodie_Type), sum)

  #d) Rename columns
  colnames(foodie_data_summed) <- c("City","Foodie_Type","Count")

  return(foodie_data_summed)

}

#4 Call prepare_data function
foodie_data_summed <- prepare_data(foodie_data)

#5 Create function to calculate average attendance by city
calculate_avg_attendance <- function(data){
  #a) Group by City and calculate average attendance
  avg_attendance_by_city <- aggregate(data$Attendees, list(data$City), mean)

  #b) Rename columns
  colnames(avg_attendance_by_city) <- c("City", "Avg_Attendance")

  return(avg_attendance_by_city)

}

#6 Call calculate_avg_attendance function
avg_attendance_by_city <- calculate_avg_attendance(foodie_data)

#7 Create table to join avg_attendance_by_city and foodie_data_summed
foodie_data_final <- merge(avg_attendance_by_city, foodie_data_summed, by = "City")

#8 Subset data by selected cities
selected_cities <- c("New York", "Los Angeles", "Chicago", "Houston", "San Francisco")
foodie_data_final_selected <- subset(foodie_data_final, City %in% selected_cities)

#9 Create bar chart to compare average attendance by city
ggplot(foodie_data_final_selected, aes(x=City, y=Count, fill=Foodie_Type)) +
  geom_bar(stat="identity", position="dodge", width=0.9, colour="black") +
  scale_fill_brewer(palette="Set2") +
  ylab("Count") +
  ggtitle("Average Attendance by City")

#10 Save bar chart as a png file
ggsave("FoodieFest_Bar_Chart.png")