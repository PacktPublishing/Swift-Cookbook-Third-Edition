//
//  ContentView.swift
//  PlaneDetection
//
//  Created by Daniel Bolella on 2/25/23.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Add configuration to detect horizontal planes
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        configuration.frameSemantics.insert(.personSegmentationWithDepth)
        arView.session.run(configuration)
        
        // Create an anchor entity
        let anchorEntity = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: [0.2, 0.2]))
        
        // Add a red box to the center of the anchor entity
        let box = MeshResource.generateBox(width: 0.1, height: 0.1, depth: 0.1)
        let boxMaterial = SimpleMaterial(color: .red, isMetallic: false)
        let boxModel = ModelEntity(mesh: box, materials: [boxMaterial])
        anchorEntity.addChild(boxModel)
        
        arView.scene.anchors.append(anchorEntity)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        // No need to update the view in this example
    }
}

struct ContentView: View {
    var body: some View {
        ARViewContainer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
