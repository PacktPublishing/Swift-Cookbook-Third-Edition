//
//  ContentView.swift
//  TaskManager
//
//  Created by Daniel Bolella on 10/28/22.
//

import SwiftUI

struct ContentView: View {
    
    var tasks = [Task]()
    
    var body: some View {
        List(tasks) { task in
            ListRowView(description: task.description,
                        category: task.category)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tasks: MockHelper.getTasks())
    }
}
