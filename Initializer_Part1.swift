print("-----------------Initialization------------------")
// Initialization involves setting an initial value for each stored property on that instance --  special methods that can be called to create a new instance of a particular type -- Swift initializers don’t return a value.

print("----------------default Initializers----------------")

class Student1
{
    var id = 1000// default value rather setting in initializer
    var name = "Nivethitha"
}
var class1 = Student1()
print(class1.id)


print("-------------------Memberwise Initializers for structures-------------------------")
struct Stud1 // if it is class stud1, it must have initializers if doesnt have default value - otherwise shows error like class has no initiazers
{
    var id: Int
    var name: String
}

//the structure receives a memberwise initializer even if it has stored properties that don’t have default values.

var struct1 = Stud1(id: 500, name: "Nive") // member wise initializers
struct1.id

class Student2
{
    let id: Int
    var name: String
    init() // without parameters - same as above student1() default value
    {
        self.id = 10
        self.name = "Nive"
    }
    
    init(id: Int, name: String)
    {
        self.id = id
        self.name = name
    }
}

var class2 = Student2()
print(class2.id)

var class3 = Student2(id: 20, name: "Nivethitha") // with parameters
class3.id

print("-----------------Customising Initialization------------")

class KiloMeter
{
    var km: Int
    init(meter m: Int)
    {
        km = Int(m / 1000)
    }
    init(_ km: Int)
    {
        self.km = km
    }
}
var class4 = KiloMeter(5) // initilazing parameter without argument labels
print(class4.km)

var class5 = KiloMeter(meter: 1000)
print(class5.km)

print("-------------Initializer Delegation for Value Types----------------")

//Initializers can call other initializers to perform part of an instance’s initialization. This process, known as initializer delegation
struct KiloMeter1
{
    var km = 1
}
struct Distance
{
    var dist = KiloMeter1()
    var meter = 1000
    init() // same as the default initializer that the structure would have received if it didn’t have its own custom initializers
    {}
    init(dist: KiloMeter1, meter: Int)
    {
        self.dist = dist
        self.meter = meter
    }
    init(meter: Int)
    {
        let calculatedKM = Int(meter / 1000)
        self.init(dist: KiloMeter1(km: calculatedKM), meter: meter)
    }
}

var struct2 = Distance()
print(struct2.dist.km)

var struct3 = Distance(dist: KiloMeter1(km: 5), meter: 5000)
print(struct3.dist.km)

var struct4 = Distance(meter: 7000)
print(struct4.dist.km)
