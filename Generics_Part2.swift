// Extending the generics type
class Class1<Ele>
{
    var num1: Ele
    init(num1: Ele) {
        self.num1 = num1
    }
}

extension Class1
{
    func display(get: Ele) -> Ele
    {
        return get
    }
}

var class1 = Class1(num1: 5)
print(class1.display(get: 10))

class Struct1<Ele>
{
    var num1: Ele
    init(num1: Ele) {
        self.num1 = num1
    }
}

extension Struct1
{
    func display(get: Ele) -> Ele
    {
        return get
    }
}



var struct1 = Struct1(num1: 5)
print(struct1.display(get: 10))

/*
func add1<T>(n1: T, n2: T)
{
    print(n1 + n2) // error - Binary operator '+' cannot be applied to two 'T' operands
}
*/

protocol Summable {
    static func +(lhs: Self, rhs: Self) -> Self
}


extension Int: Summable {}
extension Double: Summable {}

func add<T: Summable>(num1: T, num2: T, num3: T) -> T
{
    return num1 + num2 + num3
}

print(add(num1: 5, num2: 6, num3: 7))

print(add(num1: 5.0, num2: 6.0, num3: 7.0))

//print(add(num1: "Hello ", num2: "World")) // error - Global function 'add(num1:num2:)' requires that 'String' conform to 'Summable'
extension String: Summable{}

print(add(num1: "Hello ", num2: "World ", num3: "Swift!"))

protocol Multipliable {
    static func *(lhs: Self, rhs: Self) -> Self
}

extension Int: Multipliable {}
extension Double: Multipliable {}


func mul<T: Multipliable>(num1: T, num2: T) -> T
{
    return num1 * num2
}

print(mul(num1: 6, num2: 5))
print(mul(num1: 6.0, num2: 5.0))

//Type Constraints

//doc: Type constraints specify that a type parameter must inherit from a specific class, or conform to a particular protocol or protocol composition.

func equal<T: Equatable>(num1: T, num2: T) -> Bool
{
    if num1 == num2
    {
        return true
    }
    else{
        return false
    }
}

print(equal(num1: 6, num2: 7))
print(equal(num1: 5, num2: 5))

//doc: Structures that have only stored properties that conform to the Equatable protocol


struct Person: Equatable
{
    var age: Int
    var name: String
}

print(equal(num1: Person(age: 10, name: "Kala"), num2: Person(age: 10, name: "Kala")))

print(equal(num1: Person(age: 10, name: "Kala"), num2: Person(age: 10, name: "Vimala")))

class Person1
{
    var name = "Vimala"
}

class Employee1: Person1
{
    var id = 1000
}
class Employee2
{
    var id = 500
}
var emp1 = Employee1()
var emp2 = Employee2()

func show<Cl: Person1>(get: Cl)
{
    print(type(of: get))
}

show(get: emp1)
//show(get: emp2) // error - Global function 'show(get:)' requires that 'Employee2' inherit from 'Person1'


//dictionary key & set Conforming to hashable Protocol in generics
class People<P: Hashable>
{
    var city: [P: String]
    var unique: Set<P>
    init(city: [P: String], unique: Set<P>)
    {
        self.city = city
        self.unique = unique
    }
}


var people1 = People(city: [1: "One"], unique: [1,3,4,4,2])
people1.city[1]
people1.unique
