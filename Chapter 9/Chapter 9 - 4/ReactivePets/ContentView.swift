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

protocol PetDelegate: AnyObject {
    func updatePetName(name: String)
    func updatePetAge(age: String)
    func updatePetBreed(breed: String)
}

class PetClass: PetDelegate {
    var name = ""
    var age = ""
    var breed = ""
    
    func updatePetName(name: String) {
        self.name = name
    }
    
    func updatePetAge(age: String) {
        self.age = age
    }
    
    func updatePetBreed(breed: String) {
        self.breed = breed
    }
}

var petClass: PetClass = PetClass()

struct ContentView: View {
    @StateObject var pet = ObservablePet()
    var delegate: PetDelegate = petClass
    
    var body: some View {
        VStack(alignment: .center){
            Text("Your Pets Name is: \(pet.name)")
            Text("Your Pets Age is: \(pet.name)")
            Text("Your Pets Breed is: \(pet.name)")
            
            TextField("Enter name", text: $pet.name)
                .onChange(of: pet.name, perform: { name in
                    delegate.updatePetName(name: name)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Enter age", text: $pet.age)
                .onChange(of: pet.age, perform: { age in
                    delegate.updatePetAge(age: age)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Enter breed", text: $pet.breed)
                .onChange(of: pet.breed, perform: { breed in
                    delegate.updatePetBreed(breed: breed)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Divider()
            Text("The Delegation says: \(petClass.name), \(pet.age), \(pet.breed)")
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
