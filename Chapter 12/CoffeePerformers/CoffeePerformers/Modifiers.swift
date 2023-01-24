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
            
            Chart (multiplePerformers, id: \.name) { performer in
                ForEach(performer.info) { perfInfo in
                    switch selectedChartMark {
                    case .bar:
                        BarMark(
                            x: .value("Cups of Coffee", perfInfo.cups),
                            y: .value("Rating", perfInfo.rating)
                        )
                        .foregroundStyle(by: .value("Performer", performer.name))
                        .position(by: .value("Performer", performer.name), axis: .horizontal, span: .inset(15))
                        .lineStyle(StrokeStyle(lineWidth: 15))
                        .cornerRadius(10)
                    case .line:
                        LineMark(
                            x: .value("Cups of Coffee", perfInfo.cups),
                            y: .value("Rating", perfInfo.rating)
                        )
                        .foregroundStyle(by: .value("Performer", performer.name))
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
                        .position(by: .value("Performer", performer.name), axis: .horizontal, span: .inset(15))
                    case .point:
                        PointMark(
                            x: .value("Cups of Coffee", perfInfo.cups),
                            y: .value("Rating", perfInfo.rating)
                        )
                        .foregroundStyle(by: .value("Performer", performer.name))
                        .symbol{
                            Image(systemName: "star")
                        }
                    case .rect:
                        RectangleMark(
                            x: .value("Cups of Coffee", perfInfo.cups),
                            y: .value("Rating", perfInfo.rating)
                        )
                        .foregroundStyle(by: .value("Performer", performer.name))
                    }
                    if(perfInfo.rating == 5) {
                        RuleMark(
                            x: .value("Max Rating", perfInfo.cups)
                        )
                        .foregroundStyle(Color.pink)
                        .annotation(position: .overlay, alignment: .leading) {
                            Text("Peak")
                                .foregroundColor(Color.pink)
                        }
                    }
                }
            }
            .chartXAxisLabel("Cups of Coffee")
            .chartYAxisLabel("Rating")
//            .chartPlotStyle{ area in
//                area.background(.green.opacity(0.5))
//            }
            
            Picker("Chart Mark", selection: $selectedChartMark.animation(.easeInOut)) {
                Text("Bar").tag(ChartMark.bar)
                Text("Line").tag(ChartMark.line)
                Text("Area").tag(ChartMark.area)
                Text("Point").tag(ChartMark.point)
                Text("Rectangle").tag(ChartMark.rect)
            }
            .pickerStyle(.segmented)
        }
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
