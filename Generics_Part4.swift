// Extensions with a Generic Where Clause

struct Equality<T>
{
    var num1: T
    var num2: T
}

extension Equality where T: Equatable
{
    func show(num1: T, num2: T) -> Bool
    {
        print(type(of: num1))
        print(type(of: num2))
        if num1 == num2
        {
            return true
        }
        else{
            return false
        }
    }
}

var equal1 = Equality(num1: 5, num2: 6)

var temp1 = equal1.show(num1: 5, num2: 5)
print(temp1)
print(type(of: temp1))

var equal3 = Equality(num1: Equality(num1: 5, num2: 6), num2: Equality(num1: 5, num2: 6))

//var temp3 = equal3.show - error - Referencing instance method 'show(num1:num2:)' on 'Equality' requires that 'Equality<Int>' conform to 'Equatable'

//var temp3 = equal1.inDefinition // error - Instance method 'inDefinition(num1:num2:)' requires the types 'Int' and 'Array<Int>' be equivalent


extension Equality
{
    func inDefinition(num1: T, num2: T) -> Bool where T == Array<Int>
    {
        print(type(of: num1))
        print(type(of: num2))
        if num1 == num2
        {
            return true
        }
        else{
            return false
        }
    }
}

var equal2 = Equality(num1: [1,2], num2: [3,4])

var temp2 = equal2.inDefinition(num1: [5,6], num2: [5,6])
print(temp2)
print(type(of: temp2))


//------------------------------------------------------------


class Equality1<T>
{
    var num1: T
    var num2: T
    init(num1: T, num2: T)
    {
        self.num1 = num1
        self.num2 = num2
    }
}


extension Equality1 where T: Equatable // if type conforms to equatable protocol
{
    func show(num1: T, num2: T) -> Bool
    {
        print(type(of: num1))
        print(type(of: num2))
        if num1 == num2
        {
            return true
        }
        else{
            return false
        }
    }
}

var equali1 = Equality1(num1: 5, num2: 6)

var temp4 = equali1.show(num1: 5, num2: 5)
print(temp4)
print(type(of: temp4))

var equali2 = Equality1(num1: Equality1(num1: 5, num2: 6), num2: Equality1(num1: 5, num2: 6))

//var temp5 = equal3.show - error - Referencing instance method 'show(num1:num2:)' on 'Equality' requires that 'Equality<Int>' conform to 'Equatable'

//var temp5 = equal1.inDefinition // error - Instance method 'inDefinition(num1:num2:)' requires the types 'Int' and 'Array<Int>' be equivalent


extension Equality1
{
    func inDefinition(num1: T, num2: T) -> Bool where T == Array<Int>
    {
        print(type(of: num1))
        print(type(of: num2))
        if num1 == num2
        {
            return true
        }
        else{
            return false
        }
    }
}

var equali3 = Equality(num1: [1,2], num2: [3,4])

var temp5 = equali3.inDefinition(num1: [5,6], num2: [5,6])
print(temp5)
print(type(of: temp5))

class User
{
    var name = "Nive"
    init(name: String)
    {
        self.name = name
    }
}

extension Equality1 where T: User //  if type inherits from user class
{
    func shoeUserClass(get: T) -> T
    {
        print(type(of: get))
        return get
    }
}

var equali4 = Equality1(num1: User(name: "Sachin"), num2: User(name: "Raina"))
var temp6 = equali4.shoeUserClass(get: User(name: "Kapil"))
print(type(of: temp6))

//-----------------------------------------------


//Using generic where clause with extensions to a protocol

protocol Identity
{
    associatedtype type
    var name: type{
        get
    }
    var id: type{
        get
    }
    
    func showId() -> type
}

extension Identity where type == String
{
    func showName() -> String
    {
        return name
    }
}

struct Person<type>: Identity
{
    func showId() -> type {
        return id
    }
    var name: type
    var id: type
}


var pers1 = Person(name: 1, id: 101)
print(pers1.showId())
//pers1.showName() error - Referencing instance method 'showName()' on 'Identity' requires the types 'Int' and 'String' be equivalent

var pers2 = Person(name: "Nive", id: "500")
pers2.showName()
