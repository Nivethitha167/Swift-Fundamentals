// struct

//If you use an extension to add an initializer to a value type that provides default values for all of its stored properties and doesn’t define any custom initializers, you can call the default initializer and memberwise initializer for that value type from within your extension’s initializer.
struct Person
{
    static var id = 10
    var f_name = "First Name"
    var l_name = "Last Name"
}

extension Person
{
    init(l_name: String, f_name: String)
    {
        self.l_name = l_name
        self.f_name = f_name
    }
    //var num: Int - Extensions must not contain stored property
}

var defaultInit = Person()
print(defaultInit)

var memberwise = Person(f_name: "Nivethitha", l_name: "SoundarRajan")
print(memberwise)

var customInit = Person(l_name: "Sachin", f_name: "Tendulkar")
print(customInit)

//Extensions can add new convenience initializers to a class, but they can’t add new designated initializers or deinitializers to a class. Designated initializers and deinitializers must always be provided by the original class implementation.

class Name1
{
    var f_name: String
    var l_name: String
    init(l_name: String, f_name: String)
    {
        self.l_name = l_name
        self.f_name = f_name
    }
}

extension Name1
{
    convenience init(f_name: String)
    {
        self.init(l_name: "Unnamed", f_name: f_name)
    }
    /*init()
    {
        // error - Designated initializer cannot be declared in an extension of 'Name1'
    }*/
    /*deinit{
        // error - Deinitializers may only be declared within a class
    }*/
}

var class1 = Name1(f_name: "Kala")
class1.l_name

//computed property
extension Person
{
    var Full_name: String{
        get{
            return ("\(f_name) \(l_name)")
        }
        set{
            let split = newValue.split(separator: " ")
            f_name = String(split[0])
            l_name = String(split[1])
        }
    }
}

var person1 = Person(f_name: "Kala", l_name: "Nithya")
person1.Full_name

person1.Full_name = "Sheela Deepa"

person1.f_name
person1.l_name


extension Person{
    mutating func displayName() -> Void
    {
        f_name = "Mala"
        print(f_name, l_name)
    }
    static func typeMethod() -> Void
    {
        print(id)
    }
}

person1.displayName()
Person.typeMethod()


// Nested and subscripts
class MainClass{
    var st1 = "This is main class"
    var arr = ["Zero","One", "two", "three", "Four", "Five"]
}

extension MainClass{
    struct class2{
        var str2 = "This is class B"
    }
}

extension MainClass.class2{
    func display(){
        print(str2)
    }
}

var nested1 = MainClass.class2()
nested1.display()

extension MainClass{
    subscript(x: Int) -> String{
        if x == 0{
            return arr[0]
        }
        else if x == 1{
            return arr[1]
        }
        else if x == 2{
            return arr[2]
        }
        else if x == 3{
            return arr[3]
        }
        else if x == 4{
            return arr[4]
        }
        else if x == 5{
            return arr[5]
        }
        else{
            return "Only for 0 to 6"
        }
    }
}

var main1 = MainClass()
main1[0]
main1[7]
