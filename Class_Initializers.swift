//Designated initializers are the primary initializers for a class. A designated initializer fully initializes all properties introduced by that class and calls an appropriate superclass initializer to continue the initialization process up the superclass chain.

//Convenience initializers are secondary, supporting initializers for a class. You can define a convenience initializer to call a designated initializer from the same class as the convenience initializer with some of the designated initializer’s parameters set to default values.

class Person
{
    var name: String
    var age: Int
    init(name: String, age: Int)
    {
        self.name = name
        self.age = age
    }
    convenience init()
    {
        self.init(name: "No Name", age: 0)
    }
}
var class1 = Person()
class1.age



class Worker: Person
{
    var job = "Teacher" // didnt call super.init...coz it provides a default value for its properties it introduces and doesn’t define any initializers itself, so automatically inherits all of the designated and convenience initializers from its superclass.
}

var subclass1 = Worker()
subclass1.age

class Person1
{
    var name = "No name"
    var age = 0
}

class Worker1: Person1
{
    var job: String
    init(job: String)
    {
        self.job = job //If a subclass initializer performs no customization, and the superclass has a zero-argument designated initializer, you can omit a call to super.init() after assigning values to all of the subclass’s stored properties.
    }
}

var subclass2 = Worker1(job: "Engineer")
subclass2.name

//-----------------------------------------------

class Person3
{
    var name: String
    init(name: String)
    {
        self.name = name
    }
    convenience init()
    {
        self.init(name: "No Name")
    }
}

class Worker3: Person3
{
    var job: String
    init(name: String, job: String)
    {
        self.job = job
        super.init(name: name)
    }
    override convenience init(name: String)
    {
        self.init(name: name, job: "Nothing")
    }
}
var subclass3 = Worker3(name: "Kala")
subclass3.job
subclass3.name
