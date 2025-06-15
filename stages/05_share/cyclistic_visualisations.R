install.packages(c("tidyverse", "ggthemes", "scales", "ggrepel", "readr", "here"))


# Load required libraries
library(tidyverse)    # includes ggplot2, dplyr, readr, etc.
library(ggthemes)     # optional: for polished themes
library(scales)       # for formatting axes
library(ggrepel)      # for nicer labels if needed
library(readr)        # for reading CSV files
library(here)         # helps with relative paths

# Set a default ggplot theme
theme_set(theme_minimal())

# Load trip summary data (last 12 months)
trip_summary <- read_csv(here::here("../04_analyze/4_exports/trip_summary_last12.csv"))

# Bar chart: trip_count by user type (bold labels and manual Y axis)
ggplot(trip_summary, aes(x = member_casual, y = trip_count, fill = member_casual)) +
  geom_col(width = 0.6, show.legend = FALSE) +
  labs(
    title = "Trip Volume by User Type (Last 12 Months)",
    x = "User Type",
    y = "Number of Trips"
  ) +
  scale_y_continuous(
    breaks = c(1609958, 2791749),
    limits = c(0, 3000000),
    labels = comma
  ) +
  scale_fill_manual(values = c("member" = "#1f77b4", "casual" = "#ff7f0e")) +
  theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(face = "bold", size = 13),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  )

# Load trip summary data (last 12 months)
trip_summary_longterm <- read_csv(here::here("../04_analyze/4_exports/trip_summary_longterm.csv"))

# Bar chart: trip_count by user type (bold labels and manual Y axis)
ggplot(trip_summary_longterm, aes(x = member_casual, y = trip_count, fill = member_casual)) +
  geom_col(width = 0.6, show.legend = FALSE) +
  labs(
    title = "Trip Volume by User Type (2021-2023 Years)",
    x = "User Type",
    y = "Number of Trips"
  ) +
  scale_y_continuous(
    breaks = c(7951222, 5338509),
    limits = c(0, 8000000),
    labels = comma
  ) +
  scale_fill_manual(values = c("member" = "#1f77b4", "casual" = "#ff7f0e")) +
  theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(face = "bold", size = 13),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  )

# Bar chart: average ride length by user type
ggplot(trip_summary, aes(x = member_casual, y = avg_ride_length, fill = member_casual)) +
  geom_col(width = 0.6, show.legend = FALSE) +
  labs(
    title = "Average Ride Length by User Type (Last 12 Months)",
    x = "User Type",
    y = "Average Ride Length (minutes)"
  ) +
  scale_y_continuous(
    breaks = c(12.29, 23.65),
    limits = c(0, 25),
    labels = comma
  ) +
  scale_fill_manual(values = c("member" = "#1f77b4", "casual" = "#ff7f0e")) +
  theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(face = "bold", size = 13),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  )

# Bar chart: average ride length by user type
ggplot(trip_summary_longterm, aes(x = member_casual, y = avg_ride_length, fill = member_casual)) +
  geom_col(width = 0.6, show.legend = FALSE) +
  labs(
    title = "Average Ride Length by User Type (2021-2023 Years)",
    x = "User Type",
    y = "Average Ride Length (minutes)"
  ) +
  scale_y_continuous(
    breaks = c(12.57, 26.95),
    limits = c(0, 30),
    labels = comma
  ) +
  scale_fill_manual(values = c("member" = "#1f77b4", "casual" = "#ff7f0e")) +
  theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(face = "bold", size = 13),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  )


# Load ride_by_type data
ride_by_type <- read_csv(here::here("../04_analyze/4_exports/ride_by_type_last12.csv"))

# Bar chart: trip count by bike type and user type
ggplot(ride_by_type, aes(x = rideable_type, y = trip_count, fill = member_casual)) +
  geom_col(position = "dodge", width = 0.6) +
  labs(
    title = "Trip Count by Bike Type and User Type",
    x = "Bike Type",
    y = "Number of Trips",
    fill = "User Type"
  ) +
  scale_y_continuous(labels = comma) +
  scale_fill_manual(values = c("member" = "#1f77b4", "casual" = "#ff7f0e")) +
  theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(face = "bold", size = 13),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  )

# Bar chart: average ride length by bike type and user type
ggplot(ride_by_type, aes(x = rideable_type, y = avg_ride_length, fill = member_casual)) +
  geom_col(position = "dodge", width = 0.6) +
  labs(
    title = "Average Ride Length by Bike Type and User Type",
    x = "Bike Type",
    y = "Average Ride Length (minutes)",
    fill = "User Type"
  ) +
  scale_fill_manual(values = c("member" = "#1f77b4", "casual" = "#ff7f0e")) +
  theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(face = "bold", size = 13),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  )


# Ordered factor for weekday names
weekday_levels <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")

# Load daily distribution data
daily_last12 <- read_csv(here::here("../04_analyze/4_exports/daily_distribution_last12.csv"))

# Convert day_of_week to ordered factor
daily_last12$day_of_week <- factor(daily_last12$day_of_week, levels = weekday_levels)

# Line chart: trip percentage by weekday (last 12 months)
ggplot(daily_last12, aes(x = day_of_week, y = trip_percentage, color = member_casual, group = member_casual)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "Trip Percentage by Weekday (Last 12 Months)",
    x = "Day of Week",
    y = "Percentage of Trips",
    color = "User Type"
  ) +
  scale_color_manual(values = c("member" = "#1f77b4", "casual" = "#ff7f0e")) +
  theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(face = "bold", size = 13),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  )

# Line chart: average ride length by weekday (last 12 months)
ggplot(daily_last12, aes(x = day_of_week, y = avg_ride_length, color = member_casual, group = member_casual)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "Average Ride Length by Weekday (Last 12 Months)",
    x = "Day of Week",
    y = "Average Ride Length (minutes)",
    color = "User Type"
  ) +
  scale_y_continuous(
    limits = c(0, 30)
  ) +
  scale_color_manual(values = c("member" = "#1f77b4", "casual" = "#ff7f0e")) +
  theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(face = "bold", size = 13),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  )

daily_longterm <- read_csv(here::here("../04_analyze/4_exports/daily_distribution_longterm.csv"))
daily_longterm$day_of_week <- factor(daily_longterm$day_of_week, levels = weekday_levels)

# Line chart: trip percentage by weekday (2021-2023 years)
ggplot(daily_longterm, aes(x = day_of_week, y = trip_percentage, color = member_casual, group = member_casual)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "Trip Percentage by Weekday (2021-2023 years)",
    x = "Day of Week",
    y = "Percentage of Trips",
    color = "User Type"
  ) +
  scale_color_manual(values = c("member" = "#1f77b4", "casual" = "#ff7f0e")) +
  theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(face = "bold", size = 13),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  )

# Line chart: average ride length by weekday (2021-2023)
ggplot(daily_longterm, aes(x = day_of_week, y = avg_ride_length, color = member_casual, group = member_casual)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "Average Ride Length by Weekday (2021-2023 years)",
    x = "Day of Week",
    y = "Average Ride Length (minutes)",
    color = "User Type"
  ) +
  scale_y_continuous(
    limits = c(0, 35)
  ) +
  scale_color_manual(values = c("member" = "#1f77b4", "casual" = "#ff7f0e")) +
  theme(
    axis.text = element_text(size = 12),
    axis.title = element_text(face = "bold", size = 13),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  )


# Load hourly distribution data
hourly_last12 <- read_csv(here::here("../04_analyze/4_exports/hourly_distribution_last12.csv"))

# Line chart: trip percentage by hour of day
ggplot(hourly_last12, aes(x = hour_of_day, y = trip_percentage, color = member_casual, group = member_casual)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "Trip Percentage by Hour of Day (Last 12 Months)",
    x = "Hour of Day",
    y = "Percentage of Trips",
    color = "User Type"
  ) +
  scale_x_continuous(breaks = 0:23) +
  scale_color_manual(values = c("member" = "#1f77b4", "casual" = "#ff7f0e")) +
  theme(
    axis.text = element_text(size = 11),
    axis.title = element_text(face = "bold", size = 13),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  ) 


# Line chart: average ride length by hour of day
ggplot(hourly_last12, aes(x = hour_of_day, y = avg_ride_length, color = member_casual, group = member_casual)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "Average Ride Length by Hour of Day (Last 12 Months)",
    x = "Hour of Day",
    y = "Average Ride Length (minutes)",
    color = "User Type"
  ) +
  scale_x_continuous(breaks = 0:23) +
  scale_color_manual(values = c("member" = "#1f77b4", "casual" = "#ff7f0e")) +
  theme(
    axis.text = element_text(size = 11),
    axis.title = element_text(face = "bold", size = 13),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  )



# Load hourly distribution data
hourly_longterm <- read_csv(here::here("../04_analyze/4_exports/hourly_distribution_longterm.csv"))

# Line chart: trip percentage by hour of day
ggplot(hourly_longterm, aes(x = hour_of_day, y = trip_percentage, color = member_casual, group = member_casual)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "Trip Percentage by Hour of Day (2021-2023 Years)",
    x = "Hour of Day",
    y = "Percentage of Trips",
    color = "User Type"
  ) +
  scale_x_continuous(breaks = 0:23) +
  scale_color_manual(values = c("member" = "#1f77b4", "casual" = "#ff7f0e")) +
  theme(
    axis.text = element_text(size = 11),
    axis.title = element_text(face = "bold", size = 13),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  ) 


# Line chart: average ride length by hour of day
ggplot(hourly_longterm, aes(x = hour_of_day, y = avg_ride_length, color = member_casual, group = member_casual)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "Average Ride Length by Hour of Day (2021-2023 Years)",
    x = "Hour of Day",
    y = "Average Ride Length (minutes)",
    color = "User Type"
  ) +
  scale_x_continuous(breaks = 0:23) +
  scale_color_manual(values = c("member" = "#1f77b4", "casual" = "#ff7f0e")) +
  theme(
    axis.text = element_text(size = 11),
    axis.title = element_text(face = "bold", size = 13),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5)
  )


# Load start station data
start_stations <- read_csv(here::here("../04_analyze/4_exports/start_stations_last12.csv"))

# Optional: Reorder stations by total trip_count (summing across member/casual)
start_stations <- start_stations %>%
  group_by(start_station_name) %>%
  mutate(total_trips = sum(trip_count)) %>%
  ungroup() %>%
  mutate(start_station_name = fct_reorder(start_station_name, total_trips))

# Horizontal grouped bar chart
ggplot(start_stations, aes(x = trip_count, y = start_station_name, fill = member_casual)) +
  geom_col(position = "dodge", width = 0.7) +
  labs(
    title = "Top Start Stations by Trip Count (Last 12 Months)",
    x = "Number of Trips",
    y = "Start Station",
    fill = "User Type"
  ) +
  scale_x_continuous(labels = comma) +
  scale_fill_manual(values = c("member" = "#1f77b4", "casual" = "#ff7f0e")) +
  theme(
    axis.text.y = element_text(size = 10),
    axis.text.x = element_text(size = 11),
    axis.title = element_text(face = "bold", size = 13),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
    legend.position = "top"
  )

# Load start station data
start_stations_longterm <- read_csv(here::here("../04_analyze/4_exports/start_stations_longterm.csv"))

# Optional: Reorder stations by total trip_count (summing across member/casual)
start_stations_longterm <- start_stations_longterm %>%
  group_by(start_station_name) %>%
  mutate(total_trips = sum(trip_count)) %>%
  ungroup() %>%
  mutate(start_station_name = fct_reorder(start_station_name, total_trips))


# Horizontal grouped bar chart
ggplot(start_stations_longterm, aes(x = trip_count, y = start_station_name, fill = member_casual)) +
  geom_col(position = "dodge", width = 0.7) +
  labs(
    title = "Top Start Stations by Trip Count (2021-2023 Years)",
    x = "Number of Trips",
    y = "Start Station",
    fill = "User Type"
  ) +
  scale_x_continuous(labels = comma) +
  scale_fill_manual(values = c("member" = "#1f77b4", "casual" = "#ff7f0e")) +
  theme(
    axis.text.y = element_text(size = 10),
    axis.text.x = element_text(size = 11),
    axis.title = element_text(face = "bold", size = 13),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
    legend.position = "top"
  )