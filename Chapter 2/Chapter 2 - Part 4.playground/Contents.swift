import UIKit

struct PersonName {
    let givenName: String
    let familyName: String
}

enum CommunicationMethod {
    case phone
    case email
    case textMessage
    case fax
    case telepathy
    case subSpaceRelay
    case tachyons
}

class Person {
    let name: PersonName
    let preferredCommunicationMethod: CommunicationMethod
    
    convenience init(givenName: String,
                     familyName: String,
                     commsMethod: CommunicationMethod) {
        
        let name = PersonName(givenName: givenName, familyName: familyName)
        self.init(name: name, commsMethod: commsMethod)
        
    }
    init(name: PersonName, commsMethod: CommunicationMethod) { self.name = name
        preferredCommunicationMethod = commsMethod
    }
    
    var displayName: String {
        return "\(name.givenName) \(name.familyName)"
    }
}


var crew = Dictionary<String, Person>()

crew["Captain"] = Person(givenName: "Jean-Luc",
familyName: "Picard", commsMethod: .phone)

crew["First Officer"] = Person(givenName: "William",
familyName: "Riker", commsMethod: .email)

crew["Chief Engineer"] = Person(givenName: "Geordi",
familyName: "LaForge", commsMethod: .textMessage)

crew["Second Officer"] = Person(givenName: "Data",
familyName: "Soong", commsMethod: .fax)

crew["Councillor"] = Person(givenName: "Deanna",
familyName: "Troi", commsMethod: .telepathy)

crew["Security Officer"] = Person(givenName: "Tasha",
familyName: "Yar", commsMethod: .subSpaceRelay)

crew["Chief Medical Officer"] = Person(givenName: "Beverly",
familyName: "Crusher", commsMethod: .tachyons)

let roles = Array(crew.keys)
print(roles)

let firstRole = roles.first! // Chief Medical Officer
let cmo = crew[firstRole]! // Person: Beverly Crusher
print("\(firstRole): \(cmo.displayName)") // Chief Medical Officer: Beverly Crusher

print(crew["Security Officer"]!.name.givenName) // Tasha

crew["Security Officer"] = Person(givenName: "Worf",
familyName: "Son of Mogh", commsMethod: .subSpaceRelay)

print(crew["Security Officer"]!.name.givenName) // Worf






enum Role: String {
    case captain = "Captain"
    case firstOfficer = "First Officer"
    case secondOfficer = "Second Officer"
    case chiefEngineer = "Chief Engineer"
    case councillor = "Councillor"
    case securityOfficer = "Security Officer"
    case chiefMedicalOfficer = "Chief Medical Officer"
}

var crew2 = Dictionary<Role, Person>()

crew2[.captain] = Person(givenName: "Jean-Luc",
                        familyName: "Picard",
                        commsMethod: .phone)

crew2[.firstOfficer] = Person(givenName: "William",
                             familyName: "Riker",
                             commsMethod: .email)

crew2[.chiefEngineer] = Person(givenName: "Geordi",
                              familyName: "LaForge",
                              commsMethod: .textMessage)

crew2[.secondOfficer] = Person(givenName: "Data",
                              familyName: "Soong",
                              commsMethod: .fax)

crew2[.councillor] = Person(givenName: "Deanna",
                           familyName: "Troi",
                           commsMethod: .telepathy)

crew2[.securityOfficer] = Person(givenName: "Tasha",
                                familyName: "Yar",
                                commsMethod: .subSpaceRelay)

crew2[.chiefMedicalOfficer] = Person(givenName: "Beverly",
                                    familyName: "Crusher",
                                    commsMethod: .tachyons)

crew2[.captain] = Person(givenName: "Jean-Luc",
                        familyName: "Picard",
                        commsMethod: .phone)
let cmo2 = crew2[.chiefMedicalOfficer]
