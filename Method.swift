// Methods -- Methods are functions that are associated with a particular type
// have methods for Classes, Structures and Enumerations
func Function(){
    print("This is Function")
}

struct Structure
{
    func Method()
    {
        print("This is Method")
    }
}

//Instance methods -- functions that belong to instances of a particular class, structure, or enumeration.

print("-----------Class----------------")
class Operation
{
    var num1: Int
    var num2: Int
    func add() -> Int
    {
        return num1 + num2
    }
    init(num1: Int, num2: Int)
    {
        self.num1 = num1
        self.num2 = num2
    }
    func changeNum1(num1: Int) -> Int
    {
        self.num1 = num1
        return self.num1
    }
    
}
var class1 = Operation(num1: 10, num2: 20)
print(class1.add())

print(class1.changeNum1(num1: 5))
print(class1.num1)
print(class1.add())

// Structure-----------------------------

print("---------------Structure---------------------")
struct Operation1
{
    var num1: Int
    var num2: Int
    func add() -> Int
    {
        return num1 + num2
    }
    /*func changeNum1(num1: Int) -> Int
    {
        self.num1 = num1 // error - Cannot assign to property: 'self' is immutable
        return self.num1
    }*/
    
    // explanataion -- By default, the properties of a value type can’t be modified from within its instance methods.
    // so we need mutating behaviour for that method
    mutating func changeNum(n1: Int,n2: Int) -> Void
    {
        num1 = n1
        num2 = n2
    }

}
var struct1 = Operation1(num1: 10, num2: 20)
print(struct1.add())


struct1.changeNum(n1: 1, n2: 2)
print(struct1.num1, struct1.num2)
print(struct1.add())

let struct2 = Operation1(num1: 100, num2: 200)
//struct2.changeNum(n1: 11, n2: 22) // error - Cannot use mutating member on immutable value: 'struct2' is a 'let' constant -- This struct2 is now constant property eventhough num1 and num2 are variable

// ---------------Type Methods ---- methods that are called on the type itself

print("--------------Type Methods-------------------")

struct NewClass {
    static var num = 10
    var val = 0
    static func changeValue(n: Int) -> Void {
        // num = n -- error - Instance member 'num' cannot be used on type 'NewClass' - now chnaging the var num to stored type - static var num = 10
        num = n //here accessing num(type property) without the prefix of type name inside the type method
    }
}
print(NewClass.num)
NewClass.changeValue(n: 5)
print(NewClass.num)
