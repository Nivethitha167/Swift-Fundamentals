//-------Unowned References-------

//Like a weak reference, an unowned reference doesn’t keep a strong hold on the instance it refers to. Unlike a weak reference, however, an unowned reference is used when the other instance has the same lifetime or a longer lifetime.

//Unlike a weak reference, an unowned reference is expected to always have a value. As a result, marking a value as unowned doesn’t make it optional, and ARC never sets an unowned reference’s value to nil.

class User {
    var name: String
    var age: Int
    var acc: Account?
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    deinit {
        print("Deinitializing the user")
    }
}

class Account {
    var bankName: String
    var type: String
    unowned var user: User // As long as the person has account he will be the user of the bank
    
    init(bankName: String, type: String, user: User) {
        self.bankName = bankName
        self.type = type
        self.user = user
    }
    
    deinit {
        print("Deinitializing the account")
    }
}

var user1: User? = User(name: "Kala", age: 40) // user1 ---> User() (strong)

user1!.acc = Account(bankName: "Axis", type: "Savings", user: user1!)
// User() ---> Account (strong)
// Account() --> User() (unowned)

user1 = nil //Deinitializing the user
            // Deinitializing the account


// Because there are no more strong references to the User instance, it’s deallocated. After this happens, there are no more strong references to the Account instance, and it also is deallocated

//-------Unowned Optional References------------

class Customer {
    var name: String
    var token: Int
    var foodOrder: [Order]
    
    init(name: String, token: Int) {
        self.name = name
        self.token = token
        self.foodOrder = []
    }
    
    deinit {
        print("Deinitializing the customer")
    }
}

class Order {
    var name: String
    var qty: Int
    unowned var customer: Customer
    unowned var freeDessert: Order? // for some type of order they will give free desert, that time we use optional unowned
    
    init(name: String, qty: Int, customer: Customer) {
        self.name = name
        self.qty = qty
        self.customer = customer
    }
    
    deinit {
        print("deinitializing the Order \(name)")
    }
}

var cust1: Customer? = Customer(name: "Kala", token: 102)

var order1: Order? = Order(name: "Dosa", qty: 3, customer: cust1!)
var order2: Order? = Order(name: "Pizza", qty: 2, customer: cust1!)

var free: Order? = Order(name: "IceCream", qty: 1, customer: cust1!)
order2!.freeDessert = free


cust1!.foodOrder = [order1!, order2!]

cust1 = nil
order1 = nil
order2 = nil
free = nil

//IF NO STRONG REF IS THERE, THEY ARE DEALLOCATED

//Deinitializing the customer
//deinitializing the Order Dosa
//deinitializing the Order Pizza
//deinitializing the Order IceCream









