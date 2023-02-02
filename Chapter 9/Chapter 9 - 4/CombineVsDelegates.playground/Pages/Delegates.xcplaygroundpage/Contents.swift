//: [Previous](@previous)

import Foundation


protocol TimerDelegate: AnyObject {
    func timerEventReceived()
}

class TimerSender {
    var timer = Timer()
    weak var delegate: TimerDelegate?
    
    init() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerEvent), userInfo: nil, repeats: true)
    }
    
    @objc func timerEvent() {
        delegate?.timerEventReceived()
    }
}

class TimerReceiver: TimerDelegate {
    func timerEventReceived() {
        print("Timer event received")
    }
}

var receiver = TimerReceiver()
var sender = TimerSender()
sender.delegate = receiver

//: [Next](@next)
