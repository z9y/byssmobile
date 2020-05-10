import UIKit

class CheckListElement: CustomStringConvertible {
    
    var date: String
    var task: String
    var done: Bool
    
    init() {
        date = "Poniedziałek"
        task = "Zrobić pranie"
        done = true
    }
    
    init(date: String, task: String, done: Bool) {
        self.date = date
        self.task = task
        self.done = done
    }
    
    var description: String {
        return "\(date) \(task) -> \(done ? "Gotowe" : " Do Wykonania")"
    }
}

var testOne = CheckListElement(date: "Wtorek", task: "Zrobic zakupy", done: false)
print(testOne)

var testTwo = CheckListElement()
print(testTwo)
