import UIKit
import Foundation

let ratingAndDisplayString = normalizedStarRating(forRating: 5, ofPossibleTotal: 10)
let ratingNumber = ratingAndDisplayString.0
print(ratingNumber) // 3 - Use to show the right number of stars

let ratingString = ratingAndDisplayString.1
print(ratingString) // "3 Star Game" - Use to put in the label

func normalizedStarRating(forRating rating: Float,
                          ofPossibleTotal total: Float) -> (Int, String) {
    let fraction = rating / total
    let ratingOutOf5 = fraction * 5
    let roundedRating = round(ratingOutOf5) // Rounds to the nearest int.
    let numberOfStars = Int(roundedRating) // Turns a Float into an Int
    let ratingString = "\(numberOfStars) Star Game"
    return (numberOfStars, ratingString)
}

//
// There's more...
//
/*
func normalizedStarRating(forRating rating: Float, ofPossibleTotal total: Float) -> (starRating: Int, displayString: String) {
    
    let fraction = rating / total
    let ratingOutOf5 = fraction * 5
    let roundedRating = round(ratingOutOf5) // Rounds to the nearest int.
    let numberOfStars = Int(roundedRating) // Turns a Float into an Int
    let ratingString = "\(numberOfStars) Star Game"
    
    return (starRating: numberOfStars, displayString: ratingString)
}

let ratingAndDisplayString = normalizedStarRating(forRating: 5,
                                                  ofPossibleTotal: 10)

let ratingInt = ratingAndDisplayString.starRating
print(ratingInt) // 3 - Use to show the right number of stars

let ratingString = ratingAndDisplayString.displayString
print(ratingString) // "3 Stars" - Use to put in the label
 */
