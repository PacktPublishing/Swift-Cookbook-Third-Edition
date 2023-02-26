//
//  ContentView.swift
//  ComposedPlaneDetection
//
//  Created by Daniel Bolella on 2/25/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    // Load the "Plane" scene from the "Experience" Reality File
    let scene = try! Experience.loadActualPlane()
    @State var buttonUnPressed = true
    
    var body: some View {
        ZStack {
            ARViewContainer(scene: scene).edgesIgnoringSafeArea(.all)
            if buttonUnPressed {
                Button {
                    scene.status?.isEnabled = false
                    scene.bonvoyage?.isEnabled = true
                    scene.notifications.takeOff.post()
                    
                    buttonUnPressed.toggle()
                } label: {
                    Label("Take Off!", systemImage: "airplane.departure")
                }
                .buttonStyle(.borderedProminent)
                .offset(y: 150)
            } else {
                EmptyView()
            }

        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    let scene: Experience.ActualPlane
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        scene.bonvoyage?.isEnabled = false
        
        // Add the plane anchor to the scene
        arView.scene.anchors.append(scene)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
