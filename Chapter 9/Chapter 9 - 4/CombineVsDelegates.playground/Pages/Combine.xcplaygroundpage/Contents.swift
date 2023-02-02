import Combine
import Foundation

let timer = Timer.publish(every: 1, on: .main, in: .default)

let subscription = timer
    .map { _ in
        print("Timer event received")
    }
    .sink { _ in  }

timer.connect()
