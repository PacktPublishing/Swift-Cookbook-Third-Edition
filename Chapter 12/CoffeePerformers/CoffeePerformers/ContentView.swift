//
//  ContentView.swift
//  CoffeePerformers
//
//  Created by Daniel Bolella on 1/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CoffeePerformance()){
                    Label("Coffee Performance", systemImage: "1.circle")
                }
                NavigationLink(destination: MultiplePerformers()){
                    Label("Multiple Performers", systemImage: "2.circle")
                }
                NavigationLink(destination: DifferentMarks()){
                    Label("Different Marks", systemImage: "3.circle")
                }
                NavigationLink(destination: Modifiers()){
                    Label("Modifiers", systemImage: "4.circle")
                }
                NavigationLink(destination: Interactivity()){
                    Label("Interactivity", systemImage: "5.circle")
                }
            }
            .listStyle(.automatic)
            .navigationTitle("12. Swift Charts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
