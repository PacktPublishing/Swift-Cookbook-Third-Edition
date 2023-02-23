import UIKit

enum GridPosition: String {
    case player1 = "o"
    case player2 = "x"
    case empty = " "
}

struct TicTacToe {
    
    var gridStorage: [[GridPosition]] = []
    init() {
        gridStorage.append(Array(repeating: .empty, count: 3))
        gridStorage.append(Array(repeating: .empty, count: 3))
        gridStorage.append(Array(repeating: .empty, count: 3))
    }
    subscript(row: Int, column: Int) -> GridPosition { get {
        return gridStorage[row][column]
    }
        set(newValue) {
            gridStorage[row][column] = newValue
        }
    }
    func gameStateString() -> String {
        var stateString = "    \n"
        stateString += printableString(forRow: gridStorage[0])
        stateString += "    \n"
        stateString += printableString(forRow: gridStorage[1])
        stateString += "    \n"
        stateString += printableString(forRow: gridStorage[2])
        stateString += "    \n"
        return stateString
    }
    func printableString(forRow row: [GridPosition]) -> String { var rowString = "| \(row[0].rawValue) "
        rowString += "| \(row[1].rawValue) "
        rowString += "| \(row[2].rawValue) |\n"
        return rowString
    }
}

var game = TicTacToe()

// Start Move 1
game.gridStorage[1][1] = .player1
print(game.gameStateString())
// End Move 1

// Start Move 2
game.gridStorage[0][2] = .player2
print(game.gameStateString())
// End Move 2

// Start Move 3
game[0, 0] = .player1
print(game.gameStateString())
// End Move 3

// Start Move 4
game[1, 2] = .player2
print(game.gameStateString())
// End Move 4

// Start Move 5
game[2, 2] = .player1
print(game.gameStateString())
// End Move 5

let topLeft = game[0, 0]
let middle = game[1, 1]

let bottomRight = game[2, 2]
let p1HasWon = (topLeft == .player1) && (middle == .player1) && (bottomRight == .player1)


