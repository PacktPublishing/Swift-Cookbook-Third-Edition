// Pt. 1: Duplicator
func makeDuplicates<ItemType>(of item: ItemType,
                              withKeys keys: Set<String>) -> [String: ItemType] {
    
    var duplicates = [String: ItemType]()
    for key in keys {
        duplicates[key] = item
    }
    return duplicates
}

let awards: Set<String> = ["Best Visual Effects",
                           "Best Cinematography",
                           "Best Original Score",
                           "Best Film Editing"]

let oscars2022 = makeDuplicates(of: "Dune", withKeys: awards)
print(oscars2022["Best Picture"] ?? "")
// Dune
print(oscars2022["Best International Feature"] ?? "")
// Dune


// Pt. 2: Duplicator using Two Generic Types
func makeDuplicatesGeneric<ItemType, KeyType: Hashable>(of item: ItemType,
                                                 withKeys keys: Set<KeyType>)
                                                 -> [KeyType: ItemType] {
     
    var duplicates = [KeyType: ItemType]()
    for key in keys {
        duplicates[key] = item
    }
    return duplicates
}

let oscars2022Generic = makeDuplicatesGeneric(of: "Dune", withKeys: awards)
print(oscars2022Generic["Best Picture"] ?? "")
// Dune
print(oscars2022Generic["Best International Feature"] ?? "")
// Dune
