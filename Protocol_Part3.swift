//-------------Delegation and Protocol as types-----------------
protocol Identifiable
{
    var id: Int{
        get set
    }
    var name: String{
        get set
    }
}

class Employee1
{
    var sample1: Identifiable
    init(sample1: Identifiable) // protocol as paramter type in init
    {
        self.sample1 = sample1
    }
    func getNewValue(emp: Identifiable) -> Identifiable //protocol as parameter type and return type in methods
    {
        sample1.id = emp.id
        sample1.name = emp.name
        return sample1
    }
    
}

class Employee2: Identifiable
{
    var id: Int = 100
    
    var name: String = "abc"
    var age = 2
}

var emp2 = Employee2()
var emp1 = Employee1(sample1: emp2)
emp1.sample1.id

//emp1.sample1.age // error - Value of type 'Identifiable' has no member 'age'
print(type(of: emp1.sample1)) //Employee2

emp2.id = 500
emp2.name = "Nive"

var emp3 = emp1.getNewValue(emp: emp2)
print(type(of: emp3))
emp3.id
emp3.name

//-----------------------------------------------

var sample2: Identifiable = Employee2()

func getNewValue(emp: Identifiable) -> Identifiable //protocol as parameter type and return type in functions
{
    sample2.id = emp.id
    sample2.name = emp.name
    return sample2
}

var temp1 = getNewValue(emp: sample2)
temp1.id
temp1.name

//Adding Protocol Conformance with an Extension

class Employee3
{
    var age = 20
    var newName: String = "aaa"
    var newId: Int = 400
}


extension Employee3: Identifiable
{
    var name: String {
        get {
            return newName
        }
        set {
            newName = newValue
        }
    }
    
    var id: Int {
        get {
            return newId
        }
        set {
            newId = newValue
        }
    }
    
}

var emp4: Identifiable = Employee3()
emp4.id
emp4.id = 401

//Declaring Protocol Adoption with an Extension

class Employee4
{
    var id = 10
    var name = "hajbdha"
}

//docu : ref - Types don’t automatically adopt a protocol just by satisfying its requirements. They must always explicitly declare their adoption of the protocol.

extension Employee4: Identifiable
{ }
//docu: ref - If a type already conforms to all of the requirements of a protocol, but hasn’t yet stated that it adopts that protocol, you can make it adopt the protocol with an empty extension:
    


var emp5 = Employee4()
emp5.id


