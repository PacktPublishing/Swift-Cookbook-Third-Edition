//
//  ContentView.swift
//  ReactivePets
//
//  Created by Daniel Bolella on 2/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var nameStream = ""
    
    var body: some View {
        VStack(alignment: .center){
            Text("Your Pets Name is: \(nameStream)")
            
            TextField("Enter name", text: $nameStream)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Divider()
            FetchView(nameDownStream: $nameStream)
        }
        .padding()
    }
}

struct FetchView: View {
    @Binding var nameDownStream: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Go fetch the 🎾, \(nameDownStream)!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
