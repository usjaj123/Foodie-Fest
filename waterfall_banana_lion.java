/*

Foodie Fest

A Java Program by Your Name

*/

// Imports
import java.util.*; 

public class FoodieFest { 
  
    // Declare global variables
    public static Scanner userInput = new Scanner(System.in); 
    public static String[] foodItems = new String[5];
    public static int[] foodPrices = new int[5];
    public static int totalPrice; 
  
    // Main method 
    public static void main(String args[]) { 
        // Welcome the user
        System.out.println("Welcome to Foodie Fest!");

        // Store user input
        System.out.println("Please enter the names of 5 foods you'd like to purchase:");
        storeFoodItems();
    
        // Calculate the total price
        calculateTotalPrice();
          
        // Output the total price
        System.out.println("Thank you for your purchase! Your total is $" + totalPrice); 
  
        // Clean up user input 
        userInput.close(); 
    } 
  
    // Store user input food items
    public static void storeFoodItems() {
        for (int i = 0; i < 5; i++) { 
            System.out.println("Please enter item #" + (i + 1) + ":"); 
            foodItems[i] = userInput.nextLine(); 
        }
    }
  
    // Calculate the total price
    public static void calculateTotalPrice() { 
        for (int i = 0; i < 5; i++) { 
            System.out.println("Please enter the price of " + foodItems[i] + ":");
            foodPrices[i] = userInput.nextInt(); 
            totalPrice += foodPrices[i]; 
        } 
    } 
  
    // Validate user input
    public static boolean isValidNumber(String input) { 
        try { 
            Integer.parseInt(input); 
            return true; 
        } catch (NumberFormatException e) { 
            return false; 
        } 
    } 
}