import UIKit

enum ComparisonResult : Int {
    case orderedAscending
    case orderedSame
    case orderedDescending
}

enum Title: String {
    case mr = "Mr"
    case mrs = "Mrs"
    case mister = "Master"
    case miss = "Miss"
    case dr = "Dr"
    case prof = "Prof"
    case other // Inferred as "other"
    
    func isProfessional() -> Bool {
        return self == Title.dr || self == Title.prof
    }
}

let title1 = Title.mr
let title2: Title
title2 = .mr

enum CompassPoint {
    case North, South, East, West
}

enum Rating: Int {
    case worst // Infered as 0
    case bad    // Infered as 1
    case average // Infered as 2
    case good // Infered as 3
    case best // Infered as 4
}

//let title1 = Title.mr
//print(title1.rawValue) // "Mr"


let loganTitle = Title.mr
let xavierTitle = Title.prof
print(loganTitle.isProfessional) // false
print(xavierTitle.isProfessional) // true
