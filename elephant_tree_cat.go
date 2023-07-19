package main

import (
    "fmt"
    "time"
    "strings"
)

// Start of code

// Define global variables
var attendees []string // Names of attendees

// Create a struct to store information about individual food vendors
type Vendor struct {
    Name string
    Cuisine string
    PopularDish string
    Description string
    Hours string
    PriceRange string
    Location string
}

// Create a function to add a new food vendor
func addVendor(vendor Vendor) {
    vendors = append(vendors, vendor)
}

// Create a function to add an attendee to the list
func addAttendee(name string) {
    attendees = append(attendees, name)
}

// Create a function to print out a list of the vendors
func listVendors() {
    for _, vendor := range vendors {
        fmt.Printf("Name: %s \nCuisine: %s \nPopular Dish: %s \nDescription: %s \nHours: %s \nPrice Range: %s \nLocation: %s \n\n", vendor.Name, vendor.Cuisine, vendor.PopularDish, vendor.Description, vendor.Hours, vendor.PriceRange, vendor.Location)
    }
}

// Create a function to print out a list of the attendees
func listAttendees() {
    fmt.Printf("Attendees: %s \n", strings.Join(attendees, ", "))
}

// Create a function to announce the start of the event
func announceStart() {
    fmt.Println("Welcome to Foodie Fest! The event will start at 7pm")
    startTime := time.Now().UTC()
    fmt.Println("Event Start Time: ", startTime.Format("15:04:05"))
}

// Create a function to announce the end of the event
func announceEnd() {
    fmt.Println("The event is now ending. Thanks for attending!")
    endTime := time.Now().UTC()
    fmt.Println("Event End Time: ", endTime.Format("15:04:05"))
}

// Declare the array of vendors
var vendors []Vendor

func main() {
    // Create a few vendors
    tacoVendor := Vendor {
        Name: "Taco Hut",
        Cuisine: "Mexican",
        PopularDish: "Tacos",
        Description: "Authentic Mexican tacos.",
        Hours: "5pm-10pm",
        PriceRange: "Inexpensive",
        Location: "West side of park"
    }
    pizzaVendor := Vendor {
        Name: "Pizza Palace",
        Cuisine: "Italian",
        PopularDish: "Pizza",
        Description: "Authentic Italian pizza.",
        Hours: "5pm-10pm",
        PriceRange: "Moderate",
        Location: "East side of park"
    }

    // Add vendors to array
    addVendor(tacoVendor)
    addVendor(pizzaVendor)

    // Add attendees
    addAttendee("John")
    addAttendee("Sara")
    addAttendee("Alex")
    addAttendee("Mary")

    // Start the event
    announceStart()

    // List the vendors
    fmt.Println("Here are the vendors:")
    listVendors()

    // List the attendees
    listAttendees()

    // End the event
    announceEnd()
}

// End of code