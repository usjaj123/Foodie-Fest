--Foodie Fest Program--

--Greeting--
print ("Welcome to Foodie Fest!")

--Defined Variables--
local attendees = 0
local vendors = 0
local foodOptions = {}

--Function to Register Attendees--
function registerAttendee()
    
    print ("Please enter your name:")
    local name = io.read()
   
    print ("Please enter your age:")
    local age = io.read()
    
    attendees = attendees + 1 --Increment the number of attendees
    print (name .. ", you have successfully registered for Foodie Fest!")
    
end

--Function to Register Vendors--
function registerVendor()
    
    print ("Please enter your business name:")
    local name = io.read()
    
    print ("Please enter the type of food you are selling:")
    local typeOfFood = io.read()
    
    vendors = vendors + 1 --Increment the number of vendors
    print (name .. ", you have successfully registered for Foodie Fest!")
    
    --Add the food option to the food options table
    table.insert(foodOptions, typeOfFood)
end

--Function to Display Food Options--
function displayFoodOptions()
    print ("These are the food options for Foodie Fest:")
   
    for i,v in ipairs(foodOptions) do --Loop through the food options
        print(i .. " - " .. v)
    end
end

--Function to Start Festival--
function startFestival()
    
    local userInput
    
    --User Interface--
    print ("What would you like to do?")
    print ("1 - Register an attendee")
    print ("2 - Register a vendor")
    print ("3 - Display food options")
    print ("4 - Start the festival")
    
    repeat
        userInput = io.read()
        
        --Register an attendee
        if userInput == "1" then
            registerAttendee()
        
        --Register a vendor
        elseif userInput == "2" then
            registerVendor()
        
        --Display food options
        elseif userInput == "3" then
            displayFoodOptions()
        
        --Start the festival
        elseif userInput == "4" then
            print ("Foodie Fest is now open!")
            break
        else
            print ("Please enter a valid option.")
        end
        
    until userInput == "4"
    
end

--Main--
startFestival()