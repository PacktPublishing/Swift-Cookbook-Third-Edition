import UIKit

// Input parameters and output
func fullName(givenName: String,
              middleName: String,
              familyName: String) -> String {
    return "\(givenName) \(middleName) \(familyName)"
}


let myFullName = fullName(givenName: "Mandy",
                          middleName: "Mary",
                          familyName: "Barker")
print(myFullName) // Mandy Mary Pendlebury

// Input parameters, with a side effect and no output
func printFullName(givenName: String,
                   middleName: String,
                   familyName: String) {
    print("\(givenName) \(middleName) \(familyName)")
}

printFullName(givenName: "Mandy", middleName: "Mary", familyName: "Barker")

// No inputs, with an output
func fullName() -> String {
    return fullName(givenName: "Mandy",
                    middleName: "Mary",
                    familyName: "Barker")
}

// No inputs, no output
func printAuthorsFullName() {
    let personsFullName  = fullName()
    print(personsFullName)
}

//
// Below code is commented out to allow above code
// to compile in this Playground.
//

//func fullName(givenName: String,
//              middleName: String,
//              familyName: String = "Pendlebury") -> String {
//
//    return "\(givenName) \(middleName) \(familyName)"
//}
//
//let chris = fullName(givenName: "Chris", middleName: "Brian", familyName: "Barker")
//let madeleine = fullName(givenName: "Madeleine",middleName: "Rose", familyName: "Barker")
//let mandy = fullName(givenName: "Mandy", middleName: "Mary")
//
//print(chris) // Chris Brian Barker
//print(madeleine) // Madeleline Rose Barker
//print(mandy) // Mandy Mary Pendlebury


// Parameter Overloading
func combine(_ givenName: String, _ familyName: String) -> String {
    return "\(givenName) \(familyName)"
}

func combine(_ integer1: Int, _ integer2: Int) -> Int {
    return integer1+integer2
}

let combinedString = combine("Madeleine", "Barker")
let combinedInt = combine(6, 10)
print(combinedString) // Madeleine Barker
print(combinedInt) // 16
