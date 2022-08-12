
let ledZeppelin = ["Robert", "Jimmy", "John", "John Paul"]

for musician in ledZeppelin {
    print(musician)
}

// 5 times table
for value in 1...12 {
    print("5 x \(value) = \(value*5)")
}

let zeppelinByInstrument = ["vocals": "Robert",
                           "lead guitar": "Jimmy",
                           "drums": "John",
                           "bass guitar": "John Paul"]

for (key, value) in zeppelinByInstrument {
    print("\(value) plays \(key)")
}

ledZeppelin.forEach { musician in
    print(musician)
}

zeppelinByInstrument.forEach { (key, value) in
    print("\(value) plays \(key)")
}
