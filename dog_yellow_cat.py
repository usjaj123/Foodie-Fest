# Import libraries
import numpy as np
import pandas as pd
import random

# Create a dataframe for food items 
fooditems = pd.DataFrame(columns=['food','price','restaurant','rating'])

# Create a list of restaurants 
restaurants = ["McDonalds", "Burger King", "Wendy's", "Taco Bell", "KFC", "Pizza Hut", "Subway", "Dairy Queen", "Domino's"]

# Create a list of menu items from each restaurant
mcdonalds = ["Big Mac", "Quarter Pounder", "McNuggets", "Fries", "Chocolate Milkshake"]
burgerking = ["Whopper", "BK Chicken Fries", "Garden Grilled Chicken", "Onion Rings", "Tender Crispy Chicken"]
wendys = ["Dave's Hot 'N Juicy 1/4lb", "Baconator", "Crispy Chicken Sandwich", "Chili", "Frosty"]
tacobell = ["Nacho Fries Supreme", "Beefy 5-Layer Burrito", "Quesarito", "Chalupa Suprema", "Crunchwrap Supreme"]
kfc = ["Chicken Littles", "Wings", "Original Recipe Chicken", "Pot Pie", "Mac & Cheese Bowl"]
pizzahut = ["Meat Lovers Pizza", "Supreme Pizza", "Hawaiian Pizza", "Stuffed Garlic Knots", "Cheese Sticks"]
subway = ["Veggie Delite", "Meatball Marinara", "Turkey Breast", "Tuna", "Black Forest Ham"]
dairyqueen = ["Peanut Buster Parfait", "Blizzard", "Oreo Cheesecake", "Brownie Earthquake", "Choco Cone"]
dominos = ["Pacific Veggie Pizza", "Cheese Pizza", "Bread Bowl Pasta", "Stuffed Cheesy Bread", "Ultimate Pepperoni Pizza"]

# Create a function to add items to the dataframe 
def add_item(food,restaurant,price,rating):
    fooditems.loc[len(fooditems)] = [food,price,restaurant,rating]

# Populate the fooditems dataframe with items from each restaurant
for i in mcdonalds:
    p = random.uniform(4.0,7.0)
    r = random.uniform(3.5,5.0)
    add_item(i,"McDonalds",p,r)
for i in burgerking:
    p = random.uniform(4.0,7.0)
    r = random.uniform(3.5,5.0)
    add_item(i,"Burger King",p,r)
for i in wendys:
    p = random.uniform(4.0,7.0)
    r = random.uniform(3.5,5.0)
    add_item(i,"Wendy's",p,r)
for i in tacobell:
    p = random.uniform(4.0,7.0)
    r = random.uniform(3.5,5.0)
    add_item(i,"Taco Bell",p,r)
for i in kfc:
    p = random.uniform(4.0,7.0)
    r = random.uniform(3.5,5.0)
    add_item(i,"KFC",p,r)
for i in pizzahut:
    p = random.uniform(4.0,7.0)
    r = random.uniform(3.5,5.0)
    add_item(i,"Pizza Hut",p,r)
for i in subway:
    p = random.uniform(4.0,7.0)
    r = random.uniform(3.5,5.0)
    add_item(i,"Subway",p,r)
for i in dairyqueen:
    p = random.uniform(4.0,7.0)
    r = random.uniform(3.5,5.0)
    add_item(i,"Dairy Queen",p,r)
for i in dominos:
    p = random.uniform(4.0,7.0)
    r = random.uniform(3.5,5.0)
    add_item(i,"Dominos",p,r)

# Create a function to print the menu
def print_menu():
    print("Welcome to Foodie Fest!")
    for r in restaurants:
        print("\nMENU ITEMS FROM "+r+":\n")
        for i in fooditems.values:
            if i[2] == r:
                print("Food: "+str(i[0])+" | Price: "+str(i[1])+"| Rating: "+str(i[3]))

# Create a function to print the average rating of each restaurant
def avg_rating():
    print("\nAVERAGE RATINGS:\n")
    for r in restaurants:
        ratings = []
        for i in fooditems.values:
            if i[2] == r:
                ratings.append(i[3])
        if len(ratings) > 0:
            print("Average rating for "+r+": "+str(np.mean(ratings)))
        else:
            print("No ratings available for "+r)

# Create a function to get random food item 
def get_random():
    fooditem = random.choice(fooditems.values)
    print("\nYou got "+fooditem[0]+" from "+fooditem[2]+"! Enjoy!")
    
# Call the functions 
print_menu()
avg_rating()
get_random()