//
//  MultiplePerformers.swift
//  CoffeePerformers
//
//  Created by Daniel Bolella on 1/12/23.
//

import SwiftUI
import Charts

var johnPerfInfo: [PerformanceInfo] = [
    .init(cups: 0, rating: 1),
    .init(cups: 1, rating: 1),
    .init(cups: 2, rating: 1),
    .init(cups: 3, rating: 3),
    .init(cups: 4, rating: 5),
    .init(cups: 5, rating: 2),
    .init(cups: 6, rating: 0)
]

let multiplePerformers = [
    (name: "Danny", info: dannyPerfInfo),
    (name: "John", info: johnPerfInfo)
]

struct MultiplePerformers: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("Danny's Coffee  ☕️")
            Chart (multiplePerformers, id: \.name) { performer in
                ForEach(performer.info) { perfInfo in
                    BarMark(
                        x: .value("Cups of Coffee", perfInfo.cups),
                        y: .value("Rating", perfInfo.rating)
                    )
                    .foregroundStyle(by: .value("Perfomer", performer.name))
                    .position(by: .value("Perfomer", performer.name), axis: .horizontal, span: .inset(15))
                }
            }
            .chartXAxisLabel("Cups of Coffee")
            .chartYAxisLabel("Rating")
        }
        .aspectRatio(contentMode: .fit)
        .padding()
        .navigationTitle("Coffee Performers")
    }
}

struct MultiplePerformers_Previews: PreviewProvider {
    static var previews: some View {
        MultiplePerformers()
    }
}
