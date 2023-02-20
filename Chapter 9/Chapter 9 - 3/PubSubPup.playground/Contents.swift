import Foundation
import Combine

struct Puppy: Codable {
    let id: Int
    let name: String
    let breed: String
}

let url = URL(string: "https://raw.githubusercontent.com/PacktPublishing/Swift-Cookbook-Third-Edition/main/Chapter%209/Chapter%209%20-%203/Pups.json")!

let publisher = URLSession.shared
    .dataTaskPublisher(for: url)
    .map { $0.data }
    .decode(type: [Puppy].self, decoder: JSONDecoder())
    .eraseToAnyPublisher()

let subscriber = publisher
    .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
            print("Error: \(error.localizedDescription)")
        case .finished:
            print("Completed")
        }
    }, receiveValue: { pups in
        for pup in pups {
            print("Feeding \(pup.name) the \(pup.breed) a treat!")
        }
    })
