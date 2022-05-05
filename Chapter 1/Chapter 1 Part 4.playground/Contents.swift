import UIKit

class Person {
    
    let givenName: String
    let middleName: String
    let familyName: String
    var countryOfResidence: String = "UK"
    
    var displayString: String {
        return "\(self.fullName()) - Location: \(self.countryOfResidence)"
    }
    
    func fullName() -> String {
        return "\(givenName) \(middleName) \(familyName)"
    }
    
    init(givenName: String, middleName: String, familyName: String) {
        self.givenName = givenName
        self.middleName = middleName
        self.familyName = familyName
    }
    
}


final class Friend: Person {
    
    var whereWeMet: String?
    
    override var displayString: String {
        let meetingPlace = whereWeMet ?? "Don't know where we met"
        return "\(super.displayString) - \(meetingPlace)"
    }
    
}


final class Family: Person {
    
    let relationship: String
    
    init(givenName: String,
         middleName: String,
         familyName: String = "Barker",
         relationship: String) {
        
        self.relationship = relationship
        super.init(givenName: givenName,
                   middleName: middleName,
                   familyName: familyName)
        
    }
    
    override var displayString: String {
        return "\(super.displayString) - \(relationship)"
    }

}


let steve = Person(givenName: "Steven",
                   middleName: "Paul",
                   familyName: "Jobs")

let sam = Friend(givenName: "Sam",
                 middleName: "Wow",
                 familyName: "Rowley")
sam.whereWeMet = "Work together at Jaguar Land Rover"

let maddie = Family(givenName: "Madeleine",
                       middleName: "Barker",
                       relationship: "Daughter")

let mark = Family(givenName: "Mark",
                  middleName: "David",
                  familyName: "Pendlebury",
                  relationship: "Brother-In-Law")
mark.countryOfResidence = "US"

print(steve.displayString)
// Steven Paul Jobs

print(sam.displayString)
// Sam Wow Rowley - Work together at Jaguar Land Rover

print(maddie.displayString)
// Madeleine Barker - Daughter

print(mark.displayString)
// Mark David Pendlebury - Brother-In-Law



class VideoGameReview {
    let videoGameTitle: String
    var starRating: Int // Rating out of 5
    
    init(videoGameTitle: String, starRating: Int) {
        self.videoGameTitle = videoGameTitle
        self.starRating = starRating
    }
}

// Write a review
let monkeyIslandReview = VideoGameReview(videoGameTitle: "The Secret of Monkey Island",
                                         starRating: 4)

// Post it to social media
let referenceToReviewOnTwitter = monkeyIslandReview
let referenceToReviewOnFacebook = monkeyIslandReview

print(referenceToReviewOnTwitter.starRating) // 4
print(referenceToReviewOnFacebook.starRating) // 4

// Reconsider the review
monkeyIslandReview.starRating = 5

// The change is visible from anywhere with a reference to the object
print(referenceToReviewOnTwitter.starRating) // 5
print(referenceToReviewOnFacebook.starRating) // 5
