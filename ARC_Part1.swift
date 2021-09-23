// ARC - Automatic Reference Counting


//Strong reference

class User {
    var name: String
    var id: Int
    init(name: String, id: Int) {
        self.id = id
        self.name = name
        print("Initializing")
    }
    deinit {
        print("Deinitializing")
    }
    
}

var ref1: User? = User(name: "Kala", id: 1001) // Strong referrence - count = 1

//Because the new User instance has been assigned to the ref1 variable, there’s now a strong reference from ref1 to the new User instance.

var ref2 = ref1 // count = 2
print(type(of: ref2))

ref1 = nil // no message as deinitializing, coz count(ARC) = 1 for the employee instance

ref2 = nil // Deinitializing

print("------------------------------")

//-------Strong Reference Cycles Between Class Instances-------

class Employee {
    var name: String
    var id: Int
    var worksIn: Company?
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    deinit {
        print("Deinitializing Employee")
    }

}

class Company {
    var name: String
    var employee : Employee?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("Deinitializing Comapany")
    }
}


var emp1: Employee? = Employee(name: "Sheela", id: 1002)

var company1: Company? = Company(name: "ABC")

emp1!.worksIn = company1
company1!.employee = emp1

emp1 = nil // no deinit msg
company1 = nil // no deinit msg

// The strong referrence cycle is formed between these two, so the reference count does not come to zero and it cant be broken


//---------Resolving Strong Reference Cycles Between Class Instances using weak references--------

// using weak referrence - A weak reference is a reference that doesn’t keep a strong hold on the instance it refers to..

//Because a weak reference doesn’t keep a strong hold on the instance it refers to, it’s possible for that instance to be deallocated while the weak reference is still referring to it. Therefore, ARC automatically sets a weak reference to nil when the instance that it refers to is deallocated. And, because weak references need to allow their value to be changed to nil at runtime, they’re always declared as variables, rather than constants, of an optional type.

// doc - ref : Use a weak reference when the other instance has a shorter lifetime—that is, when the other instance can be deallocated first.

//Assume:  In the company class, at some point of time the company may not have that employee, so i make this person has weak.


class Employee1 {
    var name: String
    var id: Int
    var worksIn: Company1?
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    deinit {
        print("Deinitializing Employee1")
    }

}

class Company1 {
    var name: String
    weak var employee : Employee1?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("Deinitializing Comapany1")
    }
}

var emp2: Employee1? = Employee1(name: "Vimala", id: 1002)

var company2: Company1? = Company1(name: "ABC")

emp2!.worksIn = company2
company2?.employee = emp2

emp2 = nil // Deinitializing Employee1

// now there is only one strong ref to Company1

// the Employee1 has strong ref workIn to Company1, but company1 has weak refer emp to Employee1. When emp2 is nil, there is no strong ref to Employee1


company2 = nil // Deinitializing Comapany1


