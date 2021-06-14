print("------------Inheritance-------------------")
//class inherits methods, properties, and other characteristics from another class. When one class inherits from another, the inheriting class is known as a subclass, and the class it inherits from is known as its superclass. It is applicable only for class

class Person // superclass
{
    var name = "Nive"
    var age = 50 // stored prop
    func identify() -> Void  // methods
    {
        print("This is Person - Superclass")
    }
    var newAge: Int{ // compu prop
        get{
            return age + 5
        }
        set{
            age = newValue
        }
    }
    var HeightObserver: Int = 10 // stored prop
    //class var minAgeForVote = 18  //- error --> "Class stored properties not supported in classes" --> we cannot inherited stored type prop in class using class keyword , use only static for stored type prop
    
    class func displayTypeMethod() -> Void // type method
    {
        print(" This is superclass Type method")
    }
    
}

class Employee: Person //subclass
{
    var empid: Int
    var dept: String
    
    init(empid: Int, dept: String)
    {
        self.dept = dept
        self.empid = empid
    }
    
    override var name: String{ // overriding stored prop directly not possible, but we can override the stored prop by making it as computed property or observer in subclass - diff ways available - refer - stackoverflow
        get{
            return super.name
        }
        set{
            super.name = newValue
        }
    }
    
    override func identify() -> Void // overriding the parent class method
    {
        print("This is Employee - Subclass")
    }
    
    override var newAge: Int{ // overriding computed property
        get{
            return super.age + 10
        }
        set{
            super.age = newValue
        }
    }
    
    override var HeightObserver: Int// observing stored value change in sub class
    {
        willSet{
            print("This is inherited new value in sub class \(newValue)")
        }
        didSet{
            print("The is oldvalue in parent class \(oldValue)")
        }
    }
    override class func displayTypeMethod() -> Void{ // subclass type method
        print("This is base class type method")
    }
}

var subclass1 = Employee(empid: 1000, dept: "CSE")
print(subclass1.name) // inherited property
subclass1.age = 100
print(subclass1.age) // changing inherited property

print("------------Overriding---------------------------")

subclass1.identify()
subclass1.age = 50

var class1 = Person()
print(class1.newAge)

print(subclass1.newAge)

print(subclass1.name) // inheriting stored property using computed prop in subclass
subclass1.name = "Nivethitha"
print(subclass1.name)


print("----------observer-----------------")

print(subclass1.HeightObserver) // inherits stored value of parent class
subclass1.HeightObserver = 50

print("---------type method--------------")

Person.displayTypeMethod() // parent class
Employee.displayTypeMethod() // subclass
