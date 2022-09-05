import Foundation

func howLongUntilHalloween() -> String {
    
    let calendar = Calendar.current
    let timeZone = TimeZone.current
    
    let now = Date()
    let yearOfNextHalloween = calendar.component(.year, from: now)
    
    var halloweenComponents = DateComponents(calendar: calendar,
                                             timeZone: timeZone,
                                             year: yearOfNextHalloween,
                                             month: 10,
                                             day: 31,
                                             hour: 0,
                                             minute: 0,
                                             second: 0)
    
    var halloween = halloweenComponents.date!
    // If we have already had Halloween this year,
    // then we need to use Halloween next year.
    if halloween < now {
        halloweenComponents.year = yearOfNextHalloween + 1
        halloween = halloweenComponents.date!
    }
    
    let componentFormatter = DateComponentsFormatter()
    componentFormatter.unitsStyle = .full
    componentFormatter.allowedUnits = [.month, .day, .hour, .minute, .second]
    
    return componentFormatter.string(from: now, to: halloween)!
}

let timeUntilHalloween = howLongUntilHalloween()
print("Time until Halloween: \(timeUntilHalloween)")
