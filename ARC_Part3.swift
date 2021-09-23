// ---------Unowned References and Implicitly Unwrapped Optional Properties--------

class Galaxy {
    var name: String
    var planet: Planet!
    
    //the planet property has a default value of nil, like any other optional, but can be accessed without the need to unwrap its value
    
    init(name: String, planetName: String) {
        self.name = name
        self.planet = Planet(name: planetName, galaxy: self)
        print("galaxy is initialized")
    }
    
    deinit {
        print("\(name) is deinitialized")
    }
}

class Planet {
    var name: String
    unowned var galaxy: Galaxy
    
    init(name: String, galaxy: Galaxy) {
        self.name = name
        self.galaxy = galaxy
        print("planet is initialized")
    }
    
    deinit {
        print("\(name) is deinitialized")
    }
}

var galaxy1: Galaxy? = Galaxy(name: "MilkyWay", planetName: "Earth")
//planet is initialized
//galaxy is initialized

galaxy1 = nil
//MilkyWay is deinitialized
//Earth is deinitialized


//---------Strong Reference Cycles for Closures-------------

class Contact {
    var name: String
    var phNo: String
    
    lazy var printDetails: () -> () = {
        var name1 = self.name
        var no = self.phNo
        print("Name: \(name1) \t PhNo: \(no)") // here closure uses self
    }
    
    init(name: String, phNo: String) {
        self.name = name
        self.phNo = phNo
    }
    
    deinit {
        print("Contact is deinitialized")
    }
}

var contact1: Contact? = Contact(name: "Kala", phNo: "123456")
contact1!.printDetails()

contact1 = nil // no deinit msg

// Contact ---> printDetails (strong)
//printDetails ---> contact (Strong) (refering self)

//Strong reference cycle is formed between class and closure (closure are reference types)

//--------capture lists---------

var num1 = 10
var num2 = 10

var capture1 = { [num1] in
    print(num1, num2)
}

num1 = 20
num2 = 20

capture1() // 10 20

//Only the value that is captured using square bracket retains the initialize the value

//For reference types

class Number {
    var num1 = 10
}

var temp1 = Number()
var temp2 = Number()
var temp3 = Number()

var capture2 = { [temp1, temp2] in
    print(temp1.num1, temp2.num1, temp3.num1)
}

temp1.num1 = 20
temp2.num1 = 20
temp3.num1 = 20

capture2() //20 20 20

// All the values are are changed since it is reference type

print("----------Resolving Strong Reference Cycles for Closures---------------")

//Solving the above example of strong reference for closure using unowned

class NewContact {
    var name: String
    var phNo: String
    
    lazy var printDetails: () -> () = { [weak self] in // (here we can assign unowned or weak that is to be declared in square bracket separated by comma) to avoid strong reference
        var name1 = self!.name
        var no = self!.phNo
        print("Name: \(name1) \t PhNo: \(no)") // here closure uses self
    }
    
    init(name: String, phNo: String) {
        self.name = name
        self.phNo = phNo
    }
    
    deinit {
        print("Contact is deinitialized")
    }
}

var contact2: NewContact? = NewContact(name: "Kala", phNo: "123456")
contact2!.printDetails()

contact2 = nil // contact is deinitialized
