package main
import "fmt"

func main() {
	// Create a variable for storing the festival event
	var FoodieFest string = "Foodie Fest"

	// Welcome message
	fmt.Println("Welcome to", FoodieFest)

	// Create variables for storing the food items
	var toast string = "Toast"
	var eggs string = "Eggs"
	var soup string = "Soup"
	var tea string = "Tea"
	var juice string = "Juice"
	var iceCream string = "Ice Cream"
	var burrito string = "Burrito"

	// Create a slice of strings for storing the food items
	var foodItems = []string{toast, eggs, soup, tea, juice, iceCream, burrito}

	// Display all food items
	fmt.Println("Food items available at", FoodieFest)
	for _, item := range foodItems {
		fmt.Println(item)
	}

	// Create variables for storing the food prices
	var toastPrice float64 = 2.50
	var eggsPrice float64 = 2.00
	var soupPrice float64 = 3.50
	var teaPrice float64 = 1.50
	var juicePrice float64 = 2.25
	var iceCreamPrice float64 = 3.00
	var burritoPrice float64 = 4.00

	// Create a map of strings for storing the food prices
	var foodPrices = map[string]float64{
		toast:     toastPrice,
		eggs:      eggsPrice,
		soup:      soupPrice,
		tea:       teaPrice,
		juice:     juicePrice,
		iceCream:  iceCreamPrice,
		burrito:   burritoPrice,
	}

	// Display all food prices
	fmt.Println("Food prices at", FoodieFest)
	for item, price := range foodPrices {
		fmt.Println(item, "=", price)
	}

	// Create a variable for storing the total price
	var totalPrice float64

	// Calculate the total price
	for _, price := range foodPrices {
		totalPrice += price
	}

	// Calculate the average cost
	var avgCost float64 = totalPrice / float64(len(foodPrices))

	// Display the total and average cost
	fmt.Println("The total cost of the food items at", FoodieFest, "is", totalPrice)
	fmt.Println("The average cost of a food item at", FoodieFest, "is", avgCost)

	// Create a variable for storing the number of people
	var numPeople int = 25

	// Calculate the total cost for the number of people
	var totalCostForPeople float64 = totalPrice * float64(numPeople)

	// Display the total cost for the number of people
	fmt.Println("The total cost for", numPeople, "people at", FoodieFest, "is", totalCostForPeople)

	// Ask for user input
	fmt.Print("Enter number of people attending: ")
	var userNumPeople int
	fmt.Scan(&userNumPeople)

	// Calculate and display the total cost for the user's input
	var userTotalCostForPeople float64 = totalPrice * float64(userNumPeople)
	fmt.Println("The total cost for", userNumPeople, "people at", FoodieFest, "is", userTotalCostForPeople)
}