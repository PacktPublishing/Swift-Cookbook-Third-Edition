//
//  ContentView.swift
//  PlacingModels
//
//  Created by Nathan Lawlor on 19/03/2024.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        let planeEntity = try! ModelEntity.loadModel(named: "toy_biplane_idle")

        let anchorEntity = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: [0.2, 0.2]))

        anchorEntity.addChild(planeEntity)

        arView.scene.anchors.append(anchorEntity)

        planeEntity.availableAnimations.forEach { planeEntity.playAnimation($0.repeat()) }

        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        // No need to update the view in this example
    }
    
}

#Preview {
    ContentView()
}
