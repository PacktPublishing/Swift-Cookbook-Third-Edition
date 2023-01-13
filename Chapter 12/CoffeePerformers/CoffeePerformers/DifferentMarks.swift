//
//  DifferentMarks.swift
//  CoffeePerformers
//
//  Created by Daniel Bolella on 1/12/23.
//

import SwiftUI
import Charts

struct DifferentMarks: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("Danny's Coffee  ☕️")
            Chart (multiplePerformers, id: \.name) { performer in
                ForEach(performer.info) { perfInfo in
                    LineMark(
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

struct DifferentMarks_Previews: PreviewProvider {
    static var previews: some View {
        DifferentMarks()
    }
}
