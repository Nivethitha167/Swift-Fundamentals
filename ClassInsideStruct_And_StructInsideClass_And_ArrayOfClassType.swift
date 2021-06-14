var name = "abc"
var n1 = name
withUnsafePointer(to: &name) { (address) in
    print("address of name(int) = \(address)")
}
withUnsafePointer(to: &n1) { (address) in
    print("address of n1(int) = \(address)")
}
print(n1 == name)
print(name.hashValue)
print(n1.hashValue)

class a1
{
    var num = 1
}
var a2 = a1()
var a3 = a2
a2.num = 5
print(a3.num)

withUnsafePointer(to: &a2) { (address) in
    print("address of a2 (class) = \(address)")
}
withUnsafePointer(to: &a3) { (address) in
    print("address of a3 (class) = \(address)")
}
print(a2.num.hashValue)
print(a3.num.hashValue)


withUnsafePointer(to: &a2.num) { (address) in
    print("address of a2.num (int) = \(address)")
}
withUnsafePointer(to: &a3.num) { (address) in
    print("address of a3 (int) = \(address)")
}

struct b1
{
    var n = 1
}
var b2 = b1()
var b3 = b2
b2.n = 6
print(b3.n)

print(b2.n.hashValue)
print(b3.n.hashValue)

withUnsafePointer(to: &b2.n) { (address) in
    print("address of b2 (struct) = \(address)")
}
withUnsafePointer(to: &b3.n) { (address) in
    print("address of b3 (struct) = \(address)")
}
//-------passing structue inside the class--------------
struct Address
{
    var doorNo: Int = 24
    var streetName: String = "MPS street"
    var city: String = "Chennai"
}
class Employee
{
    var name: String = "abc"
    var age: Int = 70
    var addr = Address()
}
var a = Employee()
var b = a

a.age = 50
print(a.age) // 50
print(b.age) // 50

a.addr.doorNo = 30
print(b.addr.doorNo) // value of struct address have effect in copied class->struct
print(a.addr.doorNo)

print(a.addr) //Address(doorNo: 30, streetName: "MPS street", city: "Chennai")
print(b.addr) //Address(doorNo: 30, streetName: "MPS street", city: "Chennai")

print(type(of: a))
print(type(of: b))
print(type(of: a.addr))
print(type(of: b.addr))
withUnsafePointer(to: &a.age) { (address) in
    print("address of a (class) = \(address)")
}
withUnsafePointer(to: &b.age) { (address) in
    print("address of b (class) = \(address)")
}
withUnsafePointer(to: &a.addr.doorNo) { (address) in
    print("address of a.addr(struct) = \(address)")
}
withUnsafePointer(to: &b.addr.doorNo) { (address) in
    print("address of b.addr(struct) = \(address)")
}
//conclusion -- so when we try to change the values of struct in class->struct , it changes the struct value in copied class->struct -> the whole the struct is reference type

//-------------passing class inside struct ------------------

class Student{
    var id = 10
    var name = "Nive"
}

struct Department
{
    var name = "CSE"
    var stu = Student()
}

var d = Department()
var d1 = d
d.name = "ECE"
print(d.name) //ece
print(d1.name)//cse - value changes

d.stu.id = 11
print(d.stu.id) // 11
print(d1.stu.id) // 11

withUnsafePointer(to: &d.name) { (address) in
    print("address of d (struct) = \(address)")
}
withUnsafePointer(to: &d1.name) { (address) in
    print("address of d1 (struct) = \(address)")
}

withUnsafePointer(to: &d.stu.id) { (address) in
    print("address of d.stu (class) = \(address)")
}
withUnsafePointer(to: &d1.stu.id) { (address) in
    print("address of d1.stu (class) = \(address)")
}

//conclusion - so when we are passing class inside struct - when we change class values - it also changes the copied struct -> class

//----------array of class -------------------
class Name
{
    var firstName: String
    var lastName: String
    init(fName: String, lName: String)
    {
        self.firstName = fName
        self.lastName = lName
    }
    func upperLower() -> Void
    {
        print(firstName.uppercased(), lastName.lowercased())
    }
}
var new = [Name]()
print(type(of: new))
new.append(Name(fName: "Nive", lName: "SoundarRajan"))
new.append(Name(fName: "Kalpana", lName: "Chawla"))
new.append(Name(fName: "Sachin", lName: "Tendulkar"))
for i in new
{
    i.upperLower()
}

//---------------------------------------------------------

