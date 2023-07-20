% FoodieFest

% This file contains the main code for the Foodie Fest program

%% Initialization of Variables
% Initialize categories
categories = {'baked goods' 'fruits' 'vegetables' 'meats' 'canned goods' 'beverages'};

% Initialize vendor list
vendors = {'Tasty Treats' 'Fruit King' 'Veggie Palace' 'Meaty Meats' 'Can Craze' 'Drink Delight'};

% Initialize prices
price = [5.75 2.75 2.50 12.00 3.25 1.50];

%% Greeting
% Welcome the user to the Foodie Fest
disp ('Welcome to Foodie Fest!')

%% Get User Input
% Ask user to choose category and vendor
category_choice = menu('Please select a category: ', categories);
vendor_choice = menu('Please select a vendor: ', vendors);

%% Calculate Cost
% Calculate cost of items based on user choices
cost = price(category_choice) * price(vendor_choice);

%% Output
% Display cost of items to the user
fprintf('The cost of your items is $%.2f.\n', cost);

%% Thank User
% Say thank you to the user
disp('Thank you for shopping at Foodie Fest!')