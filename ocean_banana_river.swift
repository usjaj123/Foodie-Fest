import UIKit
 
class FoodieFestViewController: UIViewController {
    
    // MARK: - Properties
    let restaurantData = [
        "McDonalds",
        "Burger King",
        "KFC",
        "Chick-Fil-A",
        "Wendy's",
        "Taco Bell",
        "Subway",
        "Pizza Hut",
        "Five Guys",
        "Wingstop"
    ]
    let activityData = [
        "Bungee Jumping",
        "Horseback Riding",
        "Ice Skating",
        "Go Kart Racing",
        "Paintball",
        "Indoor Rock Climbing",
        "Trampoline Park",
        "Mini Golf",
        "Ropes Course"
    ]
    
    var restaurants : [String] = []
    var activities : [String] = []
    var currentRestaurantIndex = 0
    var currentActivityIndex = 0
    
    // MARK: - Outlets
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var activityNameLabel: UILabel!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupFoodieFest()
    }
    
    // MARK: - Helpers
    func setupFoodieFest() {
        // Setup restaurants array
        restaurants = restaurantData
        
        // Setup activities array
        activities = activityData
        
        // Load first restaurant from array
        if let firstRestaurant = restaurants.first {
            self.loadRestaurant(restaurantName: firstRestaurant)
        }
        
        // Load first activity from array
        if let firstActivity = activities.first {
            self.loadActivity(activityName: firstActivity)
        }
    }
    
    func loadRestaurant(restaurantName: String) {
        switch restaurantName {
        case "McDonalds":
            restaurantImageView.image = UIImage(named: "McDonalds")
        case "Burger King":
            restaurantImageView.image = UIImage(named: "BurgerKing")
        case "KFC":
            restaurantImageView.image = UIImage(named: "KFC")
        case "Chick-Fil-A":
            restaurantImageView.image = UIImage(named: "ChickFilA")
        case "Wendy's":
            restaurantImageView.image = UIImage(named: "Wendys")
        case "Taco Bell":
            restaurantImageView.image = UIImage(named: "TacoBell")
        case "Subway":
            restaurantImageView.image = UIImage(named: "Subway")
        case "Pizza Hut":
            restaurantImageView.image = UIImage(named: "PizzaHut")
        case "Five Guys":
            restaurantImageView.image = UIImage(named: "FiveGuys")
        case "Wingstop":
            restaurantImageView.image = UIImage(named: "Wingstop")
        default:
            break
        }
        restaurantNameLabel.text = restaurantName
    }
    
    func loadActivity(activityName: String) {
        switch activityName {
        case "Bungee Jumping":
            activityImageView.image = UIImage(named: "BungeeJumping")
        case "Horseback Riding":
            activityImageView.image = UIImage(named: "HorsebackRiding")
        case "Ice Skating":
            activityImageView.image = UIImage(named: "IceSkating")
        case "Go Kart Racing":
            activityImageView.image = UIImage(named: "GoKartRacing")
        case "Paintball":
            activityImageView.image = UIImage(named: "Paintball")
        case "Indoor Rock Climbing":
            activityImageView.image = UIImage(named: "IndoorRockClimbing")
        case "Trampoline Park":
            activityImageView.image = UIImage(named: "TrampolinePark")
        case "Mini Golf":
            activityImageView.image = UIImage(named: "MiniGolf")
        case "Ropes Course":
            activityImageView.image = UIImage(named: "RopesCourse")
        default:
            break
        }
        activityNameLabel.text = activityName
    }
    
    // MARK: - Actions
    @IBAction func restaurantNextButtonTapped(_ sender: Any) {
        // increase restaurant index
        currentRestaurantIndex += 1
        
        // check to make sure restaurant index is valid
        if currentRestaurantIndex < restaurants.count {
            let restaurantName = restaurants[currentRestaurantIndex]
            self.loadRestaurant(restaurantName: restaurantName)
        } else {
            currentRestaurantIndex = 0
            let restaurantName = restaurants.first
            self.loadRestaurant(restaurantName: restaurantName!)
        }
    }
    
    @IBAction func activityNextButtonTapped(_ sender: Any) {
        // increase activity index
        currentActivityIndex += 1
        
        // check to make sure activity index is valid
        if currentActivityIndex < activities.count {
            let activityName = activities[currentActivityIndex]
            self.loadActivity(activityName: activityName)
        } else {
            currentActivityIndex = 0
            let activityName = activities.first
            self.loadActivity(activityName: activityName!)
        }
    }
}