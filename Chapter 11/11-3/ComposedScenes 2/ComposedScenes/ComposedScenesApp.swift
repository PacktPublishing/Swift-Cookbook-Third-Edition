//
//  ComposedScenesApp.swift
//  ComposedScenes
//
//  Created by Nathan Lawlor on 23/03/2024.
//

import SwiftUI

@main
struct ComposedScenesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
