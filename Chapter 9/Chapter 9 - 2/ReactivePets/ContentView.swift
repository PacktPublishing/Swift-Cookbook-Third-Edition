//
//  ContentView.swift
//  ReactivePets
//
//  Created by Daniel Bolella on 2/1/23.
//

import SwiftUI

class ObservablePet : ObservableObject {
    @Published var name = ""
    @Published var age = ""
    @Published var breed = ""
    
    init (){ }
}

struct ContentView: View {
    @StateObject var pet = ObservablePet()
    
    var body: some View {
        VStack(alignment: .center){
            Text("Your Pets Name is: \(pet.name)")
            Text("Your Pets Age is: \(pet.age)")
            Text("Your Pets Breed is: \(pet.breed)")
            
            TextField("Enter name", text: $pet.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Enter age", text: $pet.age)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Enter breed", text: $pet.breed)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Divider()
            FetchView(petDownStream: pet)
        }
        .padding()
    }
}

struct FetchView: View {
    @ObservedObject var petDownStream: ObservablePet
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(petDownStream.name), a \(petDownStream.age) year old \(petDownStream.breed) will fetch the 🎾!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
