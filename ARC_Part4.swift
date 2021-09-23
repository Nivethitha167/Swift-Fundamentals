//-----------------TASK----------------
class Person {
    var closure1: ((Int, String) -> (String))?
    func assign(closure1: @escaping (Int, String) -> (String)) {
        self.closure1 = closure1
    }
    func callClo() {
        closure1!(5, "Hi")
    }
}

class Employee {
    var person: Person?
    var val = "Swift"
    func assignClosure() {
        person!.assign(closure1: { [unowned self] num, str in
            print(self.val)
            return "Hello"
        })
    }
    func display() {
        let emp = Employee()
        emp.person = Person()
        self.person = emp.person
        emp.assignClosure() 
    }
    func callClosure() {
        display()
        assignClosure()
        person!.callClo()
    }
}

var emp1 = Employee()
emp1.callClosure()

/*
 person = nil employee = nil --> unowned
 employee != nil person = nil --> weak

 person != nil employee != nil --> unowned
 person != nil employee = nil  --> weak //
 */


