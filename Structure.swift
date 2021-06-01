//-------------structure-----------
struct sample
{
    var a = 0
    var b = 0
}
struct Address
{
    var doorNo: Int = 24
    var c = sample()
    var streetName: String = "kalam Street"
    lazy var pincode: Int = 600001
}
var a = Address()
print(type(of: a))
var b = a
b.doorNo = 7
print(a) // here pincode value is set as nil eventhough it has default value
print(b) // here struct is value type - means it creates separate copy in memnory when assigned to another variable - so changes made are only repect to that particular instance - not changing the original instance
let c = a

//---------lazy stored procedures---------------- it is initial value is calculated only after first time it is accessed or used- mainly used for initialising it by outside factors

print(a.pincode) // now only it is initialized
print(type(of: a.pincode))
print(a) // here pincode variable shows - optional bcoz it may or nay not be accessed

//------------ structure is value type -------------------------------
//c.doorNo = 6 //here cannot change values - means we are assigning the whole struct as constant - since struct is value type - this applies all its members eventhough doorNo is variable

struct Address1
{
    var doorNo: Int = 10
    var streetName: String = "abc"
    var pincode: Int = 2
}

// memberwise intialisers - struct has automatically generated memberwise initializers - but classes not
let a1 = Address1(doorNo: 29, streetName: "kalam street", pincode: 600002)
print(a1) // stored properties - even though address1 has default values it is supposed to cange during initialization even for constant stored properties
