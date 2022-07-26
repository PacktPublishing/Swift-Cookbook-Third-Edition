import AppleInc

//
// Can Subclass Open Access Level
//
class WinSwift: SwiftLanguage {
    
    override func versionNumber() -> Float {
        return 5.7
    }
    
    override func supportedPlatforms() -> [String] {
        
        var supported = super.supportedPlatforms()
        supported.append("Windows")
        
        return supported
    }
}

//
// Read only properties
//
let apple = Apple()

let keith = Person(name: "Keith Moon")
apple.newEmployee(person: keith)

print("Current CEO: \(apple.ceo.name)")
let craig  = Person(name: "Craig Federighi")
//apple.ceo = craig // Doesn't compile

//
// Can't initialse is init is restricted
//

// Buy new iPhone
let boughtiPhone = apple.store.selliPhone(ofModel: .iPhone13ProMax)
// This works

// Try and create your own iPhone
//let buildAniPhone = AppleiPhone(model: .iPhone6S) // Doesn't compile
