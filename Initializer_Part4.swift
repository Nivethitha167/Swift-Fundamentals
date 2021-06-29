// Default in class--------------
class Person
{
    var id: Int
    var name: String
    var age: Int
    init(id: Int = 100, name: String, age: Int) // default first
    {
        self.id = id
        self.age = age
        self.name = name
    }
    init(id: Int, age: Int = 0, name: String) // default last
    {
        self.id = id
        self.name = name
        self.age = age
    }
}

var person1 = Person(id: 200, name: "Nive", age: 40)
person1.id

var person2 = Person(name: "Nive", age: 45)
person2.id

var person3 = Person(id: 100, age: 47, name: "Nive")
person3.age

var person4 = Person(id: 100, name: "Nive")
person4.age

//default in struct

class User
{
    var id: Int
    var name: String
    var age: Int
    init(id: Int = 100, name: String, age: Int) // default first
    {
        self.id = id
        self.age = age
        self.name = name
    }
    init(id: Int, age: Int = 0, name: String) // default last
    {
        self.id = id
        self.name = name
        self.age = age
    }
}

var user1 = User(id: 200, name: "Nive", age: 40)
person1.id

var user2 = User(name: "Nive", age: 45)
person2.id

var user3 = User(id: 100, age: 47, name: "Nive")
person3.age

var user4 = User(id: 100, name: "Nive")
person4.age


//conclusion - same for both struct and class while setting default values in init()

//---------------------Initializer for Value Types-------------------

//  Note: If you want your custom value type to be initializable with the default initializer and memberwise initializer, and also with your own custom initializers, write your custom initializers in an extension rather than as part of the value type’s original implementation.

struct NewUser
{
    var id: Int = 10
    var age: Int = 0
    var name: String = "Nive"
    /*init(id: Int, name: String, age: Int)
    {
        self.id = id
        self.name = name
        self.age = age
    }*/
}

//var newUser1 = NewUser() //- error- no longer to access the default values using this, because we made custom init

extension NewUser
{
    init(id: Int, name: String, age: Int)
    {
        self.id = id
        self.name = name
        self.age = age
    }
}

var newUser1 = NewUser() // default
print(newUser1)

var newUser2 = NewUser(id: 100, age: 40, name: "Nivethitha") // memberwise
print(newUser2)

var newUser3 = NewUser(id: 1000, name: "Nova", age: 10) // custom
print(newUser3)

//-----------------------------------------

class People
{
    var name: String
    var age: Int
    init()
    {
        self.name = "Unnamed"
        self.age = 10
    }
    init(name: String, age: Int)
    {
        self.name = "No Name"
        self.age = age
    }
    convenience init(age: Int)
    {
        self.init()
        self.age = age
    }
}

class Employee: People
{
    var empid: Int = 10
    override init()
    {
        super.init()
    }
    override init(name: String, age: Int)
    {
        super.init(name: name, age: age)
    }
    init(name: String, empid: Int)
    {
        self.empid = empid
        //self.Display() // error - 'self' used in method call 'Display' before 'super.init' call
        super.init()
        self.name = name
        //super.init() // before line error - 'self' used in property access 'name' before 'super.init' call
        
        self.Display()
    }
    convenience init(age: Int)
    {
        self.init()
        self.age = age
        //self.init() // before line error - 'self' used before 'self.init' call or assignment to 'self'
    }
    func Display() -> Void{
        print("This is subclass")
    }
    
}
var emp1 = Employee(name: "Nova", empid: 100)
emp1.age
emp1.empid

var emp2 = Employee(age: 38)
emp2.age
