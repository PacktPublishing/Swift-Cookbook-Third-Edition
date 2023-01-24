//
//  DifferentMarks.swift
//  CoffeePerformers
//
//  Created by Daniel Bolella on 1/12/23.
//

import SwiftUI
import Charts

enum ChartMark {
    case bar, line, area, point, rect
}

struct DifferentMarks: View {
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
                    case .line:
                        LineMark(
                            x: .value("Cups of Coffee", perfInfo.cups),
                            y: .value("Rating", perfInfo.rating)
                        )
                        .foregroundStyle(by: .value("Performer", performer.name))
                    case .area:
                        AreaMark(
                            x: .value("Cups of Coffee", perfInfo.cups),
                            y: .value("Rating", perfInfo.rating)
                        )
                        .foregroundStyle(by: .value("Performer", performer.name))
                        .position(by: .value("Performer", performer.name), axis: .horizontal, span: .inset(15))
                    case .point:
                        PointMark(
                            x: .value("Cups of Coffee", perfInfo.cups),
                            y: .value("Rating", perfInfo.rating)
                        )
                        .foregroundStyle(by: .value("Performer", performer.name))
                    case .rect:
                        RectangleMark(
                            x: .value("Cups of Coffee", perfInfo.cups),
                            y: .value("Rating", perfInfo.rating)
                        )
                        .foregroundStyle(by: .value("Performer", performer.name))
                    }
                }
            }
            .chartXAxisLabel("Cups of Coffee")
            .chartYAxisLabel("Rating")
            
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
        .navigationTitle("Different Marks")
    }
}

struct DifferentMarks_Previews: PreviewProvider {
    static var previews: some View {
        DifferentMarks()
            .previewDisplayName("Bar")
        DifferentMarks(selectedChartMark: .line)
            .previewDisplayName("Line")
        DifferentMarks(selectedChartMark: .area)
            .previewDisplayName("Area")
        DifferentMarks(selectedChartMark: .point)
            .previewDisplayName("Point")
        DifferentMarks(selectedChartMark: .rect)
            .previewDisplayName("Rectangle")
    }
}
