# Step Count Analysis

# Load necessary library for data visualization
library(ggplot2)

# Step 1: Simulate a month's worth of step count data
set.seed(123)
step_data <- data.frame(
  day = 1:30,                               # Days of the month
  steps = rnorm(30, mean = 9500, sd = 1500) # Simulate daily steps (with some variability)
)

# Step 2: Define the step goal
step_goal <- 10000

# Step 3: Analyze average step count
average_steps <- mean(step_data$steps)
cat("Average daily steps:", round(average_steps), "\n")

# Step 4: Identify days where the step goal was met or exceeded
successful_days <- step_data[step_data$steps >= step_goal, ]
cat("Number of days where step goal was met:", nrow(successful_days), "\n")

# Step 5: Plot step count over the month
ggplot(step_data, aes(x = day, y = steps)) +
  geom_line(color = "darkgreen") +                                              # Line plot for step count over time
  geom_point(color = ifelse(step_data$steps >= step_goal, "blue", "red")) +     # Color points based on goal achievement
  geom_hline(yintercept = step_goal, linetype = "dashed", color = "black") +    # Dashed line for the goal
  ggtitle("Daily Step Count Analysis") +
  xlab("Day") +
  ylab("Steps") +
  theme_minimal()

# Step 6: Identify days where step count is below the goal
below_goal_days <- step_data[step_data$steps < step_goal, ]
cat("Days with steps below the goal:\n")
print(below_goal_days)

# Step 7: Calculate percentage of days with successful step count
percent_successful <- (nrow(successful_days) / nrow(step_data)) * 100
cat("Percentage of days meeting the step goal:", round(percent_successful, 2), "%\n")
