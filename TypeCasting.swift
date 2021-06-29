class Person
{
    var name: String
    init(name: String)
    {
        self.name = name
    }
}

class Employee: Person
{
    var id: Int
    var dept: String
    init(name: String, id: Int, dept: String)
    {
        self.dept = dept
        self.id = id
        super.init(name: name)
    }
}

class NOTEmployee: Person
{
    override init(name: String)
    {
        super.init(name: name)
    }
}

var emp1 = Employee(name: "kala", id: 1, dept: "cse")

var emp2 = Employee(name: "mala", id: 2, dept: "ece")

var emp3 = Employee(name: "Vimala", id: 3, dept: "eee")


var nonemp1 = NOTEmployee(name: "sheela")

var nonemp2 = NOTEmployee(name: "kamala")

var pers1 = Person(name: "Nive")

var list = [emp1, emp2, emp3, nonemp1, nonemp2, pers1] // pers1 is base class

print(type(of: list))

//Swift’s type checker is able to deduce that employee and Notemployee have a common superclass Person, and so it infers a type of [Person] for the list array:



var emp_count = 0
var nonemp_count = 0
var pers_count = 0

//Checking type

for ele in list{
    if ele is Employee{
        emp_count += 1
    }
    else if ele is NOTEmployee{
        nonemp_count += 1
    }
    else{
        pers_count += 1
    }
}
print(emp_count, nonemp_count, pers_count)

//Downcasting

//Conditional downcasting (as?).
//Forced downcasting (as!).

//var check1 = list[0] as! Employee
//print(type(of: check1))

var check2 = list[0] as? Employee // downcasting
print(type(of: check2))

print(type(of: list[0]))

var upcast1: Person = Employee(name: "Nive", id: 1000, dept: "CSE") // upcasting
print(type(of: upcast1))

var check = list[0]
print(type(of: check))

var check3: Person = list[0]
print(type(of: check3))

var check4 = list[0]
print(type(of: check4))

if let emp = list[0] as? Employee{
    print("Emp id is \(emp.name)")
}
else{
    print("Wrong downcasting")
}

if let notemp = list[3] as? NOTEmployee{
    print("NOTemployee name is \(notemp.name)")
}
else{
    print("wrong downcasting")
}
print("---------------------------------------")

if let notemp = list[3] as? Employee{ // the ans is nil and prints else part
    print("NOTemployee name is \(notemp.name)")
}
else{
    print("wrong downcasting")
}

/*if let notemp = list[3] as! NOTEmployee{ // here ans is nil when trying to force unwrap result in error program crash
    print("NOTemployee name is \(notemp.name)")
}
else{
    print("wrong downcasting")
}*/

var check1 = list[0] as! Employee
print(type(of: check1))

/*if let emp = (list[0] as! Employee){  // doubt - error - Initializer for conditional binding must have Optional type, not 'Employee'
    print("Emp id is \(emp.name)")
}
else{
    print("Wrong downcasting")
}*/

//Type casting for any

class people
{
    var name: String = "Nive"
}

var people1 = people()

var type1: [Any] = []
type1.append(1)
type1.append(1.0)
type1.append("1.0")
type1.append(emp1)

print(type(of: type1))
print(type(of: type1[0]))

for i in type1
{
    print(type(of: i))
}

for ele in type1
{
    switch ele{
    case let ele1 as Int:
        print(ele1)
    case let ele2 as Double:
        print(ele2)
    case let ele3 as String:
        print(ele3)
    case let ele4 as Employee:
        print(ele4.name)

    default:
        print("No type")
    }
}

var type2: [AnyObject] = []
type2.append(emp1)
type2.append(people1)

print(type(of: type2))

var dict1: [String: AnyObject]

//var dict1: [Any: String] = [1: "This is Int", 1.0: "This is Double"] // error - Type 'Any' does not conform to protocol 'Hashable'

//var set1: Set<Any> // error - Type 'Any' does not conform to protocol 'Hashable'

var dict2: [AnyHashable: String] = [1: "This is Int", "str": "this is doble", true: "This is class"]
print(dict2[1]!)
print(type(of: dict2))

for i in dict2.keys
{
    print(type(of: i))
}
var temp1 = list[0] as? Employee
print(type(of: temp1))
var temp2 = list[0] as! Employee
print(type(of: temp2))
if let emp = list[0] as? Employee{ //here i am initializing an optional<Employee> type - so it works fine
    print("Emp id is \(emp.name)")
}
else{
    print("Wrong downcasting")
}

/*if let emp = (list[0] as! Employee){ // // here i am initializing an employee type not optional type
    print("Emp id is \(emp.name)")
}
else{
    print("Wrong downcasting")
}*/


//(list[0] as! Employee) is Employee type
//(list[0] as? Employee) is optional<Employee> type - so it works fine in this case
// optional binding - i have to assign constant or var to optional type (not to non- optional type) - thats why I got the error - Initializer for conditional binding must have optional type, not 'Employee'
