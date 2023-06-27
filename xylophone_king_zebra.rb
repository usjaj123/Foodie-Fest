# App File
require_relative 'foodie_fest'

class App
  def self.run
    FoodieFest.new.show_menu
  end
end

App.run

# Foodie Fest File
class FoodieFest
  MENU = {
    1 => {
      name: "Taco Salad",
      price: 8.50
    },
    2 => {
      name: "Enchilada Plate",
      price: 11.25
    },
    3 => {
      name: "Chimichanga",
      price: 10.00
    },
    4 => {
      name: "Chicken Fajitas",
      price: 9.75
    },
    5 => {
      name: "Cheese Quesadilla",
      price: 8.00
    }
  }
  
  def initialize
    @order = []
  end
  
  def show_menu
    MENU.each do |item, details|
      puts "#{item}. #{details[:name]} - $#{details[:price]}"
    end
    puts "What would you like to order?"
    input = gets.chomp
    order(input)
  end
  
  def order(item)
    @order << item
    puts "Added #{MENU[item.to_i][:name]} to your order!"
    
    order_more?
  end
  
  def order_more?
    puts "Would you like to order anything else? (y/n)"
    input = gets.chomp
    
    if input == "y"
      show_menu
    elsif input == "n"
      checkout
    else
      puts "Please enter a valid response."
      order_more?
    end
  end
  
  def checkout
    puts "Thanks for your order!"
    @order.each do |item|
      puts "#{MENU[item.to_i][:name]} - #{MENU[item.to_i][:price]}"
    end 
    total = @order.inject(0) {|sum, item| sum + MENU[item.to_i][:price]}
    puts "Your total is $#{total}"
  end 
end