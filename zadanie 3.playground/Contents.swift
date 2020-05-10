import UIKit

protocol CanBeDone {
    var done: Bool { get }
    func setDone(val: Bool)
}

enum WeekDay: CustomStringConvertible {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    var description: String {
        switch self {
        case .monday:
            return "Poniedziałek"
        case .tuesday:
            return "Wtorek"
        case .wednesday:
            return "Środa"
        case .thursday:
            return "Czwartek"
        case .friday:
            return "Piątek"
        case .saturday:
            return "Sobota"
        case .sunday:
            return "Niedziela"
        }
    }
}

class CheckListElement: CustomStringConvertible, CanBeDone {
    
    var date: WeekDay
    var task: String
    var done: Bool
    
    init() {
        date = .monday
        task = "Zrobić pranie"
        done = true
    }
    
    init(date: WeekDay, task: String, done: Bool) {
        self.date = date
        self.task = task
        self.done = done
    }
    
    var description: String {
        return "\(date) \(task) -> \(done ? "Gotowe" : " Do Wykonania")"
    }
    
    func setDone(val: Bool) {
        self.done = val
    }
}

var testOne = CheckListElement(date: .tuesday, task: "Zrobic zakupy", done: false)
print(testOne)

var testTwo = CheckListElement()
print(testTwo)

testOne.setDone(val: true)
print(testOne)



