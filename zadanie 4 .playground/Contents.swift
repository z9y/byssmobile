import UIKit

protocol CanBeDone {
    var done: Bool { get }
    func setDone(val: Bool)
}

protocol PrintCheckListElementsProtocol {
    func printAllCheckListElements()
}

class CheckListElement: CustomStringConvertible, CanBeDone {
    
    var printCheckListElementsProtocol: PrintCheckListElementsProtocol!
    var date: String
    var task: String
    var done: Bool
    
    init() {
        date = "Poniedziałek"
        task = "Zrobić pranie"
        done = false
    }
    
    init(date: String, task: String, done: Bool) {
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

var testOne = [CheckListElement(date: "Środa", task: "Wyrzucić śmieci", done: true), CheckListElement()]
var list = CheckList(checkListElements: testOne)

testOne[0].setDone(val: false)
