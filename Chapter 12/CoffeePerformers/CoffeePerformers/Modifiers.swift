//
//  Modifiers.swift
//  CoffeePerformers
//
//  Created by Daniel Bolella on 1/12/23.
//

import SwiftUI
import Charts

struct Modifiers: View {
    @State var selectedChartMark: ChartMark = .bar
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Danny's Coffee  ☕️")
            
            Chart {
                ForEach(dannyPerfInfo) { perfInfo in
                    switch selectedChartMark {
                    case .bar:
                        BarMark(
                            x: .value("Cups of Coffee", perfInfo.cups),
                            y: .value("Rating", perfInfo.rating)
                        )
                        .lineStyle(StrokeStyle(lineWidth: 15))
                        .cornerRadius(10)
                    case .line:
                        LineMark(
                            x: .value("Cups of Coffee", perfInfo.cups),
                            y: .value("Rating", perfInfo.rating)
                        )
                        .interpolationMethod(.catmullRom)
                        .lineStyle(StrokeStyle(lineWidth: 15))
                    case .area:
                        let curGradient = LinearGradient(
                            gradient: Gradient (
                                colors: [
                                    Color(.red),
                                    Color(.yellow)
                                ]
                            ),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        
                        AreaMark(
                            x: .value("Cups of Coffee", perfInfo.cups),
                            y: .value("Rating", perfInfo.rating)
                        )
                        .foregroundStyle(curGradient)
                    case .point:
                        PointMark(
                            x: .value("Cups of Coffee", perfInfo.cups),
                            y: .value("Rating", perfInfo.rating)
                        )
                        .symbol{
                            Image(systemName: "star")
                        }
                    case .rect:
                        RectangleMark(
                            x: .value("Cups of Coffee", perfInfo.cups),
                            y: .value("Rating", perfInfo.rating)
                        )
                    }
                    if(perfInfo.rating == 5) {
                        RuleMark(
                            x: .value("Max Rating", perfInfo.cups)
                        )
                        .foregroundStyle(Color.orange)
                        .annotation(position: .overlay, alignment: .leading) {
                            Text("Peak\nPerformance")
                                .foregroundColor(Color.orange)
                        }
                    }
                }
            }
            .chartXAxisLabel("Cups of Coffee")
            .chartYAxisLabel("Rating")
            .chartPlotStyle{ area in
                area.background(.green.opacity(0.5))
            }
            
            Picker("Chart Mark", selection: $selectedChartMark.animation(.easeInOut)) {
                Text("Bar").tag(ChartMark.bar)
                Text("Line").tag(ChartMark.line)
                Text("Area").tag(ChartMark.area)
                Text("Point").tag(ChartMark.point)
                Text("Rectangle").tag(ChartMark.rect)
            }
            .pickerStyle(.segmented)
        }
        .aspectRatio(contentMode: .fit)
        .padding()
        .navigationTitle("Modifiers")
    }
}

struct Modifiers_Previews: PreviewProvider {
    static var previews: some View {
        Modifiers()
            .previewDisplayName("Bar")
        Modifiers(selectedChartMark: .line)
            .previewDisplayName("Line")
        Modifiers(selectedChartMark: .area)
            .previewDisplayName("Area")
        Modifiers(selectedChartMark: .point)
            .previewDisplayName("Point")
        Modifiers(selectedChartMark: .rect)
            .previewDisplayName("Rectangle")
    }
}
