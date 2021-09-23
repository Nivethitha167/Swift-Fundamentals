protocol Cookable: Equatable {
    var item: [String] {
        get
    }
}

struct Vegetable: Cookable {
    var item: [String] = ["Tomato", "Brinjal", "Potato"]
    
}

func display() -> some Cookable {
    return Vegetable()
}

var temp = display()
print(type(of: temp)) // Vegetable


//--------------------------------------


protocol Edible {
    associatedtype type
    var names: [type] {
        get
    }
}

struct Fruits<type>: Edible {
    var names: [type]
}

//An 'opaque' type must specify only 'Any', 'AnyObject', protocols, and/or a base class


//func toDisplay(names: [String]) -> Collection { // error - Protocol 'Collection' can only be used as a generic constraint because it has Self or associated type requirements

//doc: "You can’t use Container as the return type of a function because that protocol has an associated type."

func toDisplay<T>(names: [T]) -> some Collection {
    let names2 = names[0...1]
    
    //return names2[0] // String
    //return Set(names2) // Set<String>
    
    return names2 //ArraySlice<String>
}

var fruit1 = Fruits(names: ["Apple", "Orange", "Mango"])

var temp1 = toDisplay(names: fruit1.names)
print(type(of: temp1)) //ArraySlice<String>


//-----------------------------------------------

class Person {
    var name: String = "abc"
}

class Employee1: Person {
    var id: Int = 100
}

class Employee2: Person {
    var id: String = "200"
}

func showType() -> some Person {
    return Employee2()
}

var type1: Person = Employee2()
    
var temp2 = showType()
print(type(of: temp2))

