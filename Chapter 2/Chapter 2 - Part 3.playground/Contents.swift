import UIKit

let fibonacciArray: Array<Int> = [1, 1, 2, 3, 5, 8, 13, 21, 34]
let fibonacciSet: Set<Int> = [1, 1, 2, 3, 5, 8, 13, 21, 34]
print(fibonacciArray.count) // 9
print(fibonacciSet.count) // 8

var animals: Set<String> = ["cat", "dog", "mouse", "elephant"]
animals.insert("rabbit")
print(animals.contains("dog")) // true
animals.remove("dog")
print(animals.contains("dog")) // false

let evenNumbers = Set<Int>(arrayLiteral: 2, 4, 6, 8, 10)
let oddNumbers: Set<Int> = [1, 3, 5, 7, 9]
let squareNumbers: Set<Int> = [1, 4, 9]
let triangularNumbers: Set<Int> = [1, 3, 6, 10]

let evenOrTriangularNumbers = evenNumbers.union(triangularNumbers)
// 2, 4, 6, 8, 10, 1, 3, unordered
print(evenOrTriangularNumbers.count) // 7

let oddAndSquareNumbers = oddNumbers.intersection(squareNumbers)
// 1, 9, unordered
print(oddAndSquareNumbers.count) // 2

let squareOrTriangularNotBoth = squareNumbers.symmetricDifference(triangularNumbers)
// 4, 9, 3, 6, 10, unordered
print(squareOrTriangularNotBoth.count) // 5

let squareNotOdd = squareNumbers.subtracting(oddNumbers) // 4
print(squareNotOdd.count) // 1

let animalKingdom: Set<String> = ["dog",
                                  "cat",
                                  "pidgeon",
                                  "chimpanzee",
                                  "snake",
                                  "kangaroo",
                                  "giraffe",
                                  "elephant",
                                  "tiger",
                                  "lion",
                                  "panther"]

let vertebrates: Set<String> = ["dog", "cat", "pidgeon",
"chimpanzee", "snake", "kangaroo", "giraffe", "elephant", "tiger", "lion", "panther"]

let reptile: Set<String> = ["snake"]

let mammals: Set<String> = ["dog", "cat", "chimpanzee",
"kangaroo", "giraffe", "elephant", "tiger", "lion", "panther"]

let catFamily: Set<String> = ["cat", "tiger", "lion", "panther"]
let domesticAnimals: Set<String> = ["cat", "dog"]

print(mammals.isSubset(of: animalKingdom)) // true
print(mammals.isSuperset(of: catFamily)) // true

print(vertebrates.isStrictSubset(of: animalKingdom)) // false
print(mammals.isStrictSubset(of: animalKingdom)) // true

print(animalKingdom.isStrictSuperset(of: vertebrates)) // false
print(animalKingdom.isStrictSuperset(of: domesticAnimals))    // true

print(catFamily.isDisjoint(with: reptile)) // true


