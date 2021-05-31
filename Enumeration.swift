//---------------------enumerations---------------
// common type for a group of related values - enum keyword
print("using string")
enum direction: String{
    case forward = "1"
    case backward
    case left = "2"
    case right = "4"
}// user defined type
var dir = direction.left
print(direction.backward.rawValue) // raw Values are default values of same type - here string takes case as default value if not specified explicitly
print(type(of: dir))
print(dir.rawValue)

dir = .right // using (.) we can chnage to another value of direction
print(dir.rawValue)

print("using char")
enum direction1: Character{
    case forward = "1"
    case backward = "3" //we have define values are cases if not error, because the value which assigns according previous case or default only work for integer or string
    case left = "2"
    case right = "4"
}// user defined type
//dir = direction1.left // error because direction is one type so we cannot another type to the existing type
var dir1 = direction1.left
print(direction1.backward.rawValue)
print(type(of: dir1))
print(dir1.rawValue)

dir1 = .right
print(dir1.rawValue)

print("Using Int")
enum direction2: Int{
    case forward = 1
    case backward
    case left = 6
    case right
}// user defined type
var dir2 = direction2.left
print(direction2.backward.rawValue) // here Int takes case as default value as previous one if not specified explicitly - if none of them specifies it takes 0, 1, 2.... as values
print(type(of: dir2))
print(dir2.rawValue)

dir2 = .right // using (.) we can chnage to another value of direction
print(dir2.rawValue)
print(direction2(rawValue : 6)!)

//------------associated values-------------
// opp to raw values - we can specify the type of each case
enum name: String, CaseIterable // a type that provides collection of all its values  - to use raw type separete this with comma
{
    case kala = "KA"
    case mala = "MA"
    case sheela = "SH"
}
print(name.allCases.count)

for i in name.allCases
{
    print(i.rawValue)
}

enum operation: CaseIterable // using caseiterable for associated values
{
    static var allCases: [operation]{
        return [.sqaure(1), .add(2, 3)]
    }
    
    case sqaure(Int)
    case add(Int, Int)
}
print(type(of: operation.sqaure))
print(operation.allCases.count)
