#!/usr/bin/env ruby

# Foodie Fest!
# 
# An annual food-tasting event

# This is the entry point for the program
def run
  # Initialize variables
  # Set up a list of food for the event
  food_list = ["tacos", "churros", "barbecue", "curry", "sushi", "tiramisu"]

  # Create an array to store attendees' ratings
  ratings = []

  # Begin the food-tasting event!
  puts "Welcome to Foodie Fest! We're excited to have you here today."
  food_list.each do |food|
    puts "Let's try #{food}!"
    rating = prompt_for_rating
    ratings.push(rating)
  end

  # Display the average rating
  average_rating = average(ratings)
  puts "Thanks for your participation! The average rating for this event was #{average_rating}"
end

# Prompt the user for a rating
def prompt_for_rating
  puts "Please enter your rating for this food on a scale of 1 (lowest) to 10 (highest)"
  rating = gets.chomp.to_i
  if rating < 1 || rating > 10
    puts "Invalid rating. Please enter a rating between 1 and 10"
    prompt_for_rating
  else
    rating
  end
end

# Calculates the average rating
def average(ratings)
  total = 0.0
  ratings.each do |rating|
    total += rating
  end
  total / ratings.length
end

# Start the program
run