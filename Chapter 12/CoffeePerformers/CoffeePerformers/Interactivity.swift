//
//  Interactivity.swift
//  CoffeePerformers
//
//  Created by Daniel Bolella on 1/12/23.
//

import SwiftUI
import Charts

struct Interactivity: View {
    @State var lollipopValue: Int?
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Danny's Coffee  ☕️")
            Chart {
                ForEach(dannyPerfInfo) { perfInfo in
                    AreaMark(
                        x: .value("Cups of Coffee", perfInfo.cups),
                        y: .value("Rating", perfInfo.rating)
                    )
                    if let lollipopValue {
                        RuleMark(x: .value("Current Value", lollipopValue))
                            .foregroundStyle(.pink)
                            .lineStyle(.init(dash: [2], dashPhase: 5))
                            .annotation(position: .trailing) {
                                VStack(alignment: .leading) {
                                    Text("Cups of Coffee: \(lollipopValue)")
                                        .font(.body)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background {
                                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                                        .fill(.white.shadow(.drop(radius: 1)))
                                }
                            }
                    }
                }
            }
            .chartXAxisLabel("Cups of Coffee")
            .chartYAxisLabel("Rating")
        }
        .aspectRatio(contentMode: .fit)
        .padding()
        .navigationTitle("Interactivity")
        .chartOverlay { proxy in
            Rectangle()
                .fill(.clear).contentShape(Rectangle())
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let location = value.location
                            if let xValue: Int = proxy.value(atX: location.x){
                                lollipopValue = xValue
                            }
                        }
                        .onEnded { value in
                            lollipopValue = nil
                        }
                )
        }
    }
}

struct Interactivity_Previews: PreviewProvider {
    static var previews: some View {
        Interactivity()
    }
}
