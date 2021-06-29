struct Person
{
    var name: String = "xyz"
    var age: Int
    var nickName: String? = "abc"
    var height: Int?
    var place: String
}
//var person1 = Person(age: 10, name: "abc")  error - Argument 'name' must precede argument 'age' - it must preserve the same order the way it is defined

var person1 = Person(name: "abc", age: 15, place: "Chennai") // if we provide any values while creating instance it overides the value if it has default value
print(person1)

var person2 = Person(age: 15, nickName: "alphabets", place: "mars")
print(person2)
 

var person3 = Person(age: 15, height: 10, place: "earth")
print(person3)

var person4 = Person(age: 50, place: "Jupiter")
print(person4)

var person5 = Person(name: "xyz", age: 70, nickName: "None", height: 70, place: "Jupiter")
print(person5)

//-------------------------------------------------------

struct User
{
    var name: String
    var age: Int = 50
    var nickName: String?
    var height: Int?
    var country: String = "Unknown"
    init(city: String, age: Int, name: String)
    {
        if city == "Delhi"
        {
            country = "India"
        }
        self.name = name
        //here i am not initializing the age and no error - understanding:: not necessary to initialize all the value we get , if not then it takes the default value, but make sure all properties have values
    }
}

//Note that if you define a custom initializer for a value type, you will no longer have access to the default initializer (or the memberwise initializer, if it’s a structure) for that type.

//var user1 = User(name: String) error - missing arguments becoz i made custom initializer and memberwise initializer no more exists

var user1 = User(city: "Delhi",age: 100, name: "kala")
print(user1)

var user2 = User(city: "Chennai", age: 150, name: "mala")
print(user2)

//---------------------------initializing nested classs---------------------------

class Address
{
    var street: String
    var doorno: Int
    init()
    {
        street = "No street"
        doorno = 10
    }
    init(doorno: Int, street: String)
    {
        self.doorno = doorno
        self.street = street
    }
}

//var address1 = Address()
//address1.doorno

//var address2 = Address(doorno: 50, street: "cross street")
//address2.doorno

class show: Address
{
    override init()
    {
        super.init()
        //doorno = 500 // error - For class instances, a constant property can be modified during initialization only by the class that introduces it. It can’t be modified by a subclass.
    }
}

var show1 = show()
show1.doorno

class People
{
    var name: String = "xyz"
    var age: Int = 10
    var height: Int?
    let place: String
    var addr: Address
    init(age: Int, height: Int, place: String, addr: Address)
    {
        self.place = place
        self.addr = addr
        //here i am not initializing the age and height and no error - understanding:: not necessary to initialize all the value we get , if not then it takes the default value, but make sure all properties have values
    }
}
var people1 = People(age: 50, height: 70, place: "Antartica", addr: Address(doorno: 24, street: "MPS street"))
people1.age
people1.place
people1.addr.doorno

//-----------------------------
