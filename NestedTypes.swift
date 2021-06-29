class Chat
{
    var sender: String
    var receiver: String
    
    init(sender: String, receiver: String)
    {
        self.sender = sender
        self.receiver = receiver
    }
    
    var status = Message.sent
    
    enum Message {
        case sent
        case received
        case read
    }
    func Info() -> Void
    {
        print("The status of the message from the sender \(sender) to receiver \(receiver) is \(status)")
        
    }
}

var chat1 = Chat(sender: "Kala", receiver: "Mala")
chat1.Info()

chat1.status = Chat.Message.read
chat1.Info()

class Person
{
    var name: String
    init(name: String, emp: Employee)
    {
        self.name = name
        self.emp = emp
    }
    class Employee{
        var empid: Int
        init(empid: Int)
        {
            self.empid = empid
        }
    }
    var emp: Employee
    
}
var class1 = Person(name: "Nive", emp: Person.Employee(empid: 5))
class1.emp.empid

var nestedclass1 = Person.Employee(empid: 10)
print(type(of: nestedclass1))
nestedclass1.empid

struct Person1
{
    var name: String
    init(name: String, emp: Employee1)
    {
        self.name = name
        self.emp = emp
    }
    struct Employee1{
        var empid: Int
        init(empid: Int)
        {
            self.empid = empid
        }
    }
    var emp: Employee1
    
}
var struct1 = Person1(name: "Nive", emp: Person1.Employee1(empid: 5))
struct1.emp.empid

var nestedstruct1 = Person1.Employee1(empid: 10)
print(type(of: nestedstruct1))
nestedstruct1.empid
