import UIKit

struct PersonName {
    let givenName: String
    let middleName: String
    var familyName: String
    
    func fullName() -> String {
        return "\(givenName) \(middleName) \(familyName)"
    }
    
    mutating func change(familyName: String) {
        self.familyName = familyName
    }
        
}

var duncansName = PersonName(givenName: "Duncan",
                             middleName: "Zowie",
                             familyName: "Jones")


let duncansBirthName = PersonName(givenName: "Duncan",
                                  middleName: "Zowie",
                                  familyName: "Jones")
print(duncansBirthName.fullName()) // Duncan Zowie Jones

var duncansCurrentName = duncansBirthName
print(duncansCurrentName.fullName()) // Duncan Zowie Jones

duncansCurrentName.change(familyName: "Bowie")
print(duncansBirthName.fullName()) // Duncan Zowie Jones
print(duncansCurrentName.fullName()) // Duncan Zowie Bowie
