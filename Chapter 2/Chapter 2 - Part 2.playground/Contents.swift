import UIKit
import Foundation

var gamesToPlay = [String]()

gamesToPlay.append("The Secret of Monkey Island")
gamesToPlay.append("Half Life 2")
gamesToPlay.append("Alien Isolation")

print(gamesToPlay[0]) // "The Secret of Monkey Island"
print(gamesToPlay[1]) // "Half Life 2"
print(gamesToPlay[2]) // "Alien Isolation"

print(gamesToPlay.count) // 3

gamesToPlay.insert("Breath of the Wild", at: 2)

print(gamesToPlay.count) // 4
print(gamesToPlay)
// "The Secret of Monkey Island"
// "Half Life 2"
// "Breath of the Wild"
// "Alien Isolation"

let firstGameToPlay = gamesToPlay.first ?? ""
print(firstGameToPlay) // "The Secret of Monkey Island"
let lastGameToPlay = gamesToPlay.last ?? ""
print(lastGameToPlay as Any) // "Alien Isolation"

let secondMovieToWatch = gamesToPlay[1]
print(secondMovieToWatch) // "Ghostbusters"

gamesToPlay[1] = "Half Life 2 (2004)"
print(gamesToPlay.count) // 4
print(gamesToPlay)
// "The Secret of Monkey Island"
// "Half Life 2 (2004)"
// "Breath of the Wild"
// "Alien Isolation"

let graphicAdventureGames: [String] = ["Monkey Island 2",
                                       "Loom",
                                       "Sam & Max"]

gamesToPlay = gamesToPlay + graphicAdventureGames
print(gamesToPlay.count) // 7
print(gamesToPlay)
// "The Secret of Monkey Island"
// "Half Life 2 (2004)"
// "Breath of the Wild"
// "Alien Isolation"
// "Monkey Island 2"
// "Loom"
// "Sam & Max"

var batmanGames = Array<String>(repeating: "Batman: ", count: 3)
batmanGames[0] = batmanGames[0] + "Arkham Asylum"
batmanGames[1] = batmanGames[1] + "Arkham City"
batmanGames[2] = batmanGames[2] + "Arkham Knight"
print(batmanGames)
// Batman: Arkham Asylum
// Batman: Arkham City
// Batman: Arkham Knight

gamesToPlay.replaceSubrange(2...4, with: batmanGames)
print(gamesToPlay.count) // 7
print(gamesToPlay)
// "The Secret of Monkey Island"
// "Half Life 2 (2004)"
// Batman: Arkham Asylum
// Batman: Arkham City
// Batman: Arkham Knight
// "Breath of the Wild"
// "Alien Isolation"

gamesToPlay.remove(at: 6)
print(gamesToPlay.count) // 6
print(gamesToPlay)
// "The Secret of Monkey Island"
// "Half Life 2 (2004)"
// Batman: Arkham Asylum
// Batman: Arkham City
// Batman: Arkham Knight
// "Breath of the Wild"

let evenNumbersTo10 = [2, 4, 6, 8, 10]
evenNumbersTo10.append(12) // Doesn't compile

var evenNumbersTo12 = evenNumbersTo10
evenNumbersTo12.append(12) // Does compile
