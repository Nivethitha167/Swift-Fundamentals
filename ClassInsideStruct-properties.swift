//-------------set of classes ----------------
class Person {
    var name: String
    var age: Int
    init(name: String, age: Int)
    {
        self.name = name
        self.age = age
    }
}
//var p1 = Set<Person>() // error - type person does not conformed to protocol Hashable
var p2 = [Int: Person]() // no error  bcoz default hashable for dictionay values
print(type(of: p2))

//var p3 = [Person: Int]() // error - Dictionary requires that person conform to hashable

//conclusion - so for set and dictionay key we cannot give struct or class as a type, we need to make them hashable explicitly

//Extensions can add new functionality to a type, but they can’t override existing functionality.

extension Person: Hashable {
      static func ==(lhs: Person, rhs: Person) -> Bool {
           return lhs.name == rhs.name && lhs.age == rhs.age
      }
    func hash(into hasher: inout Hasher) {
            hasher.combine(name)
            hasher.combine(age)
        }
}
var person1 = Person(name: "Nive", age : 70)
var person3 = person1
var person2 = Person(name: "Abdul Kalam", age : 75)

print(person1 == person3)

print(person1.hashValue)
print(person3.hashValue)

person3.age = 50

print(person1 == person3)

print(person1.hashValue)
print(person3.hashValue)

person1.age = 70


let allPerson = [person1,person2]
let searchedPerson = Person(name: "Nive", age: 70)

 if allPerson[0] == searchedPerson {
       print(false)
 } else if allPerson[1] == searchedPerson {
       print(true)
 }
 if allPerson.contains(searchedPerson) {
       print(true)
 }


print(allPerson[0].hashValue)
print(searchedPerson.hashValue)
var s = Set<Person> ()
s = [person1, person2, searchedPerson] // set of classes
print(s.count)
print(s) // person1 and searchedPerson are same so not added


//--------------dictionary key as class-------------

var d = [Person: String]()
print(type(of: d))
d = [person1: "First Person", person2: "Second Person"]
for (key,value) in d
{
    print(key, value)
}

//-----------------------------------class inside struct - compound properties - property observers

// Computed properties does not require storage allocation
class Student{
    var id = 10
    var name = "Nive"
    init(id: Int, name: String)
    {
        self.id = id
        self.name = name
    }
}

struct Department
{
    var deptName: String
    var stu = Student(id: 5, name: "Mala") // 100
    var newStu: Student{ // 105
        get{
            return stu
        }
        set{
            stu.id = newValue.id
            stu.name = newValue.name
        }
    }
    var newObs: Student{ // 110
        willSet{
            print("newvalue")
            print(newValue.id)
        }
        didSet
        {
            print("oldalue")
            print(oldValue.id)
        }
    }
}

var s1 = Student(id: 0, name: "Vimala")
var s2 = Student(id: 9, name: "Vimala")
var n1 = Department(deptName: "Cse", stu: s1, newObs: s2)// so for get and set we dont need initialisation

//expln --> 100 { id = 0, name = "vimala"}   105 { id = 0, name = "vimala"} 110 { id = 9, name = "vimala}
n1.stu = s2
print(n1.stu.id)
print(s2.id)
print(n1.newStu.id)

withUnsafePointer(to: &n1.stu.id) { (address) in
    print("address of n1.stu.id = \(address)")
}
withUnsafePointer(to: &s2.id) { (address) in
    print("address of s2.id = \(address)")
}
withUnsafePointer(to: &n1.newStu.id) { (address) in
    print("address of n1.newStu.id = \(address)")
}

n1.stu = s1

//expln --> 100 { id = 6, name = "Vimala"} 105 { id = 6, name = "vimala"} 110 { id = 9, name = "vimala"}

print(n1.newStu.id)
print(n1.newStu.name)
print(n1.stu.id)
print(n1.stu.name)
print(s2.id)// value changes since we set the value as 6
print(s2.name)
withUnsafePointer(to: &n1.stu.id) { (address) in
    print("address of n1.stu.id = \(address)")
}
withUnsafePointer(to: &s2.id) { (address) in
    print("address of s2.id = \(address)")
}
withUnsafePointer(to: &n1.newStu.id) { (address) in
    print("address of n1.newStu.id = \(address)")
}

n1.newObs = Student(id: 0101, name: "Sheela")
print("observer")

// epln --> 100 { id = 101, name ="vimala"} 105 { id = 101, name = "vimala"} 110 { id = 101, name = "vimala" }

print(n1.newObs.id)
print(s2.id)

//------------------------
class Foo {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
class StuFoo{
    var myFoo : Foo {
        willSet {
            print("my foo will be: \(newValue.name)")
        }
        didSet {
            print("my foo was: \(oldValue.name)")
        }
    }
    init(myFoo: Foo)
    {
        self.myFoo = myFoo
    }
}
var struct1 = StuFoo(myFoo: Foo(name: "James", age: 33))

var class1 = Foo(name: "John", age: 33)
struct1.myFoo = class1

struct1.myFoo.name = "sachin"
print(struct1.myFoo.name)
print(class1.name)

var class2 = Foo(name: " Sun", age: 33)
struct1.myFoo = class2
print(class1.name)

//-------------------very important----------

class Class
{
    var i = 0
    init(i: Int){
        self.i = i
    }
}
var a = Class(i: 1)
var b = Class(i: 2)
var c = a
print(c.i)
c.i = 5
print(c.i)
print(a.i)
c = b // c is no more same as a's reference coz here a and b points to diff instance of the class
c.i = 7
print(c.i)
print(b.i)
print(a.i)
