// Generics Subscripts
class College<T>
{
    var classes: [T]
    init(classes: [T]) {
        self.classes = classes
    }
    subscript(index: Int) -> T {
        return classes[index]
    }
}

var clg = College(classes: ["Cse","Ece","Eee"])
print(clg[0])

struct College1<T>
{
    var classes: [T]
    init(classes: [T]) {
        self.classes = classes
    }
    subscript(index: Int) -> T {
        return classes[index]
    }
}

var clg1 = College(classes: ["Cse","Ece","Eee"])
print(clg1[0])

protocol Edible
{
    associatedtype type
    var name: [type] {
        get
    }
    subscript(ind: Int) -> type {
        get
    }
}

struct Fruit<type>: Edible {
    var name: [type]
    subscript(ind: Int) -> type {
        return name[ind]
    }
}

var fruit1 = Fruit(name: ["Apple", "Orange", "Mango"])

print(fruit1[0])

//---------------------------------

protocol Eatable {
    associatedtype type
    var name: [type] {
        get
    }
    subscript(ind: Int) -> type {
        get
    }
}

extension Eatable {
    subscript(ind: Int) -> type {
        return name[ind]
        
    }
}


struct Vegetable<type>: Eatable {
    var name: [type]
}

var veg1 = Vegetable(name: ["Brinjal", "tomato"])
print(veg1[0])

//----------------------------
//generic class inheritance


class Person<type>{
    
    var name: type
    var age: type
    init(name: type, age: type)
    {
        self.name = name
        self.age = age
    }
}

class Employee<type, U>: Person<type> {
    
    var id: U
    init(id: U, name: type, age: type)
    {
        self.id = id
        super.init(name: name, age: age)
    }
}

var emp = Employee(id: 100, name: "kala", age: "40")
type(of: emp.id)
type(of: emp.name)
type(of: emp.age)

//  Inheriting associated type in protocol

protocol Namable {
    associatedtype type1
    var name: type1 {
        get
    }
}

protocol Identifiable: Namable {
    var id: type1 {
        get
    }
}

struct Human<type1>: Identifiable {
    
    var name: type1
    var id: type1

}

