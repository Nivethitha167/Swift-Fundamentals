struct Structure {
    static var name = "Sturcture"
    static var value = 1
    static var age = 18
    static var minValue : Int {
        get{
            return value
        }
        set{
            value = newValue
        }
    }
    var newAge: Int{
        get{
            return Structure.age
        }
        set{
            if newValue > Structure.age
            {
                Structure.age = newValue
            }
        }
    }
    var function: Void
    {
        print(Structure.name, Structure.value, Structure.age)
    }
}


var struct1 = Structure()
print("Structure")
struct1.function

struct1.newAge = 22
print(struct1.newAge)
print(Structure.age)

var struct2 = Structure()
print(struct2.newAge)

Structure.minValue = -1
print(Structure.minValue)
print(Structure.value)



//----------------------------------------------------------------------------

class Class {
    static var name = "Class"
    static var value = 1
    //class var age = 18 -- error-- class keyword isn’t supported with stored properties.
    static var age = 18
    static var minValue : Int {
        get{
            return value
        }
        set{
            value = newValue
        }
    }
    var newAge: Int{
        get{
            return Class.age
        }
        set{
            if newValue > Class.age
            {
                Class.age = newValue
            }
        }
    }
    class var num: Int {
        return 0
    }
    var function: Void
    {
        print(Class.name, Class.value, Class.age)
    }
}

class SubClass: Class{
    override class var num: Int
    {
        return 7
    }
    //override static var minValue: Int //-- error -- Static Type Properties can’t be overridden in the subclass. The keyword class is used on the computed properties in this case.
}

var class1 = Class()
print("class")
class1.function

class1.newAge = 22
print(class1.newAge)
print(Class.age)

var class2 = Class()
print(class2.newAge)

Class.minValue = -1
print(Class.minValue)
print(Class.value)

print(Class.num)
print(SubClass.num)// overriding the parent class

//----------------------------------------------------------------
enum Enumeration {
    //var stored = "Enumerations"// error - enums not contain stored properties
    case lenovo
    case samsung
    var computed: String {
        switch self{
        case .lenovo:
            return "LEN"
        case .samsung:
            return "SAM"
    }
    }
}
var enum1 = Enumeration.lenovo

print(enum1.computed)

enum Enum: Int{
    static var stored = "Enum"
    case app = 1
    static var computed: String
    {
        return "This is \(Enum.stored)  and the app value is \(app.rawValue)"
        
    }
}
print(Enum.app.rawValue)
print(Enum.computed)
