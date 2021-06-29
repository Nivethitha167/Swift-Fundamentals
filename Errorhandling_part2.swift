let stud = ["CSE": "Kala", "ECE": "Mala"]

enum CustomErrors: Error {

case NoName

case NoCourse

}

func UserDetails(names: [String: String]) throws -> String {

    defer{
        print("Checking executing if error is thrown")
    }
guard let check = names["EEE"] else {

throw CustomErrors.NoName

}

return check

}

//let user = try! UserDetails(names: stud) // generate run time error if throws error

//print("Name: \(user)")

do{
    try UserDetails(names: stud)
}
catch{
    print(error)
}


func Function(){

print("Message 1")

print("Message 2")

defer {

print("deferred block 2")

}

defer {  // if this is the end of scope means -- warning - 'defer' statement at end of scope always executes immediately; replace with 'do' statement to silence this warning

print("deferred block 1")
    
  //  return 5 - error - 'return' cannot transfer control out of a defer statement

}
   print("last Line of block")

}

Function()

var num = 50

class Person
{
    var name: String
    var age: Int
    var id: Int
    init(name: String, id: Int, age: Int)
    {
        self.id = id
        defer{
            print("Initializing id")
        }
        self.name = name
        self.age = age
        defer{ // error - 'self' used in method call '$defer' before all stored properties are initialized
            //self.age = age
            print("Initialising age")
        } // here no warning if i use differ at last...
        //print("Initializing")

    }
    deinit {
        defer { // warning if this is the end of the statement - defer' statement at end of scope always executes immediately; replace with 'do' statement to silence this warning
            print(num)
        }
        num -= 10
    }
}

var person1: Person? = Person(name: "Nive", id: 10, age: 93)
person1 = nil

struct Name
{
    var f_name: String
    var l_name: String
    init(f_name: String, l_name: String)
    {
        self.f_name = f_name
        self.l_name = l_name
    }
    mutating func Display() -> Void
    {
        f_name = f_name + "!" // error - Cannot assign to property: 'self' is immutable
        l_name = l_name + "!!"// error - Cannot assign to property: 'self' is immutable
        print(f_name, l_name)
    }
}
// By default, the properties of a value type cannot be modified from within its instance methods.

var name1 = Name(f_name: "Nivethitha", l_name: "SoundarRajan")
//name1.f_name = "Nive"
name1.Display()
