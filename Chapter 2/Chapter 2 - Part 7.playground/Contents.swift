import UIKit

class UserManager {
    var currentUserName: String = "Guybrush Threepwood" {
        willSet (newUserName) {
            print("Goodbye to \(currentUserName)")
            print("I hear \(newUserName) is on their way!")
        }
        didSet (oldUserName) {
            print("Welcome to \(currentUserName)")
            print("I miss \(oldUserName) already!")
        }
    }
}


let manager = UserManager()
manager.currentUserName = "Elaine Marley"
// Goodbye to Guybrush Threepwood
// I hear Elaine Marley is on their way!
// Welcome to Elaine Marley
// I miss Guybrush Threepwood already!

manager.currentUserName = "Ghost Pirare LeChuck"
// Goodbye to Elaine Marley
// I hear Ghost Pirare LeChuck is on their way!
// Welcome to Ghost Pirare LeChuck
// I miss Elaine Marley already!
