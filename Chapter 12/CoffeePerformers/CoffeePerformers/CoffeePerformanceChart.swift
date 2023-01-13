//
//  CoffeePerformanceChart.swift
//  CoffeePerformers
//
//  Created by Daniel Bolella on 1/12/23.
//

import SwiftUI
import Charts

struct PerformanceInfo: Identifiable {
    var cups: Int
    var rating: Int
    var id = UUID()
}

var dannyPerfInfo: [PerformanceInfo] = [
    .init(cups: 0, rating: 1),
    .init(cups: 1, rating: 2),
    .init(cups: 2, rating: 4),
    .init(cups: 3, rating: 5),
    .init(cups: 4, rating: 3),
    .init(cups: 5, rating: 1)
]

struct CoffeePerformanceChart: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("Danny's Coffee Performance  ☕️")
            Chart {
                ForEach(dannyPerfInfo) { perfInfo in
                    BarMark(
                        x: .value("Cups of Coffee", perfInfo.cups),
                        y: .value("Rating", perfInfo.rating)
                    )
                }
            }
            .chartXAxisLabel("Cups of Coffee")
            .chartYAxisLabel("Rating")
        }
        .aspectRatio(contentMode: .fit)
        .padding()
    }
}

struct CoffeePerformanceChart_Previews: PreviewProvider {
    static var previews: some View {
        CoffeePerformanceChart()
    }
}
