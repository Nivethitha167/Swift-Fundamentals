//------------------ class -----------------
struct Address
{
    var doorNo: Int = 24
    var streetName: String = "kalam Street"
    var pincode: Int = 600001
}
class EmployeeDetails {
    var name = "Nive"
    let Addr = Address()
    var age = 50
}// always declare in UpperCamelCase for types like class and struct and lowerCamelcase for functions and variables
var a = EmployeeDetails()
print(type(of: a))
var b = a
b.age = 60
print(b.age, a.age) // here both a nd b changes bcoz class is a reference type - it points to same memory so it gets changed
let c = a
c.age = 70
print(a.age, b.age, c.age) // though c is constant class is reference so we can suppose to change its members value
//c.Addr.doorNo = 5 - error because addr is constant
print(type(of: c.Addr))

//Identical Operator - to check whether two variables refers same instance of the class
print(a === c)

/*
 class EmployeeDetails1 {
    var name: Int
    var age: Int
}
var a1 = EmployeeDetails(name: "Nive", age: 50)
 */ //classes cant automatically generate member initializers

