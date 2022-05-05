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

class Person {
    
    let birthName: PersonName
    var currentName: PersonName
    var countryOfResidence: String
    
    init(name: PersonName, countryOfResidence: String = "UK") {
        birthName = name
        currentName = name
        self.countryOfResidence = countryOfResidence
    }
    var displayString: String {
        return "\(currentName.fullName()) - Location: \(countryOfResidence)"
    }
    
    var saveHandler: ((Bool) -> Void)?
    
    func saveToRemoteDatabase(handler: @escaping (Bool) -> Void) {
        saveHandler = handler
        // Send person information to remove database
        // Once remote save is complete, it calls saveComplete(Bool)
        // We'll fake it for the moment, and assume the save is
        // complete.
        saveComplete(success: true)
    }
    func saveComplete(success: Bool) { saveHandler?(success)
    }
    
}

// No input, no output
let printAuthorsDetails: () -> Void = {
    let name = PersonName(givenName: "Chris",
                          middleName: "Brian",
                          familyName: "Barker")
    let author = Person(name: name)
    print(author.displayString)
}
printAuthorsDetails() // "Chris Brian Barker - Location: UK"


// No input, Person output
let createAuthor: () -> Person = {
    let name = PersonName(givenName: "Chris",
                          middleName: "Brian",
                          familyName: "Barker")
    let author = Person(name: name)
    return author
}
let author1 = createAuthor()
print(author1.displayString) // "Chris Brian Barker - Location: UK"


// String inputs, no output
let printPersonsDetails: (String, String, String) -> Void = { given,
    middle,
    family in
    
    let name = PersonName(givenName: given,
                          middleName: middle,
                          familyName: family)
    
    let author = Person(name: name)
    print(author.displayString)
}
printPersonsDetails("Mandy", "Mary", "Barker")
// "Mandy Mary Barker - Location: UK"


// String inputs, Person output
let createPerson: (String, String, String) -> Person = { given,
    middle,
    family in
    
    let name = PersonName(givenName: given,
                          middleName: middle,
                          familyName: family)
    let person = Person(name: name)
    return person
}

let felix = createPerson("Madeleine", "Rose", "Barker")
print(felix.displayString) // "Madeleine Rose Barker - Location: UK"

let author = createAuthor()
print(author.displayString) // "Chris Brian Barker - Location: UK"






let fox = createPerson("Mandy", "Mary", "Barker")
fox.saveToRemoteDatabase(handler: { success in
    print("Saved finished. Successful: \(success)")
})

let fox1 = createPerson("Mandy", "Mary", "Barker")
fox1.saveToRemoteDatabase() { success in
    print("Saved finished. Successful: \(success)")
}
