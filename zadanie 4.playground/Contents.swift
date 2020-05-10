import UIKit

protocol CanBeDone {
    var done: Bool { get }
    func setDone(val: Bool)
}

protocol PrintCheckListElementsProtocol {
    func printAllCheckListElements()
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
    
    var printCheckListElementsProtocol: PrintCheckListElementsProtocol!
    var date: WeekDay
    var task: String
    var done: Bool
    
    init() {
        date = .monday
        task = "Zrobić pranie"
        done = false
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
        self.printCheckListElementsProtocol.printAllCheckListElements()
    }
}

class CheckList: PrintCheckListElementsProtocol {
    func printAllCheckListElements() {
        for element in checkListElements {
            print(element)
        }
    }
    
    var checkListElements: [CheckListElement]

    init(checkListElements: [CheckListElement]) {
        self.checkListElements = checkListElements
        for element in checkListElements {
            element.printCheckListElementsProtocol = self
        }
    }
}

var testOne = [CheckListElement(date: .wednesday, task: "Wyrzucić śmieci", done: true), CheckListElement()]
var list = CheckList(checkListElements: testOne)

testOne[0].setDone(val: false)
