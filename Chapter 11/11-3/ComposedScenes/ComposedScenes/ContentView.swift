//
//  ContentView.swift
//  ComposedScenes
//
//  Created by Nathan Lawlor on 22/03/2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
