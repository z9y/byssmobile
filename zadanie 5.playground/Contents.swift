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
    
    func everyThirdElement(){
        for (index, element) in checkListElements.enumerated() {
            if(index % 3 == 2) {print(element)}
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

var testOne = [
    CheckListElement(date: .monday, task: "Wyrzucić śmieci", done: false),
    CheckListElement(),
    CheckListElement(date: .monday, task: "Wyjść z psem", done: false),
    CheckListElement(date: .tuesday, task: "Zrobić zakupy", done: true),
    CheckListElement(date: .wednesday, task: "Ugotować obiad", done: false),
    CheckListElement(date: .wednesday, task: "Pozmywać naczynia", done: false),
    CheckListElement(date: .thursday, task: "Umyć samochód", done: false),
    CheckListElement(date: .friday, task: "Zrobić zakupy", done: false),
    CheckListElement(date: .saturday, task: "Ugotować obiad", done: false),
    CheckListElement(date: .sunday, task: "Umyć okna", done: false)
]

var list = CheckList(checkListElements: testOne)

var newList = CheckList(checkListElements: testOne)

testOne[2].setDone(val: true)
print("---")
newList.everyThirdElement()


