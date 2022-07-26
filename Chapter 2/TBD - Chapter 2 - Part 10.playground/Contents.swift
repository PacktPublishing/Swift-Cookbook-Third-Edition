import UIKit

struct Game {
    var title: String?
    var publisher: String?
    var year: Int?
}

var myGame: Game!
//print(myGame.title)

//func getGame() {
//    guard let _myGame = myGame else {
//        print("No Game Object Found")
//        return
//    }
//    print (_myGame)
//}

//_ = getGame()



//func getGame(_ game: Game?) -> Game? {
//    guard let myGame = game else {
//        print("No Game Object Found")
//        return nil
//    }
//    print(game?.title)
//    return myGame
//}
//
////getGame(Game(title: "Monkey Island", publisher: "Lucas Games", year: 1993))
//getGame(Game())


func getGame(_ game: Game?) -> Game? {
    guard let myGame = game, let _ = myGame.title else {
        print("No Game Object Found")
        return nil
    }
    print(game?.title)
    return myGame
}

//getGame(Game(title: "Monkey Island", publisher: "Lucas Games", year: 1993))
getGame(Game())
