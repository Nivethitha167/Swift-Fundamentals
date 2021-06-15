//A failable initializer creates an optional value of the type it initializes. You write return nil within a failable initializer to indicate a point at which initialization failure can be triggered.
class Item
{
    var name: String
    init?(name: String)
    {
        if name.isEmpty
        {
            return nil
        }
        self.name = name
    }
}
class Offer: Item
{
    var minQuantity: Int
    init?(name: String, minQuantity: Int)
    {
        if minQuantity < 2
        {
            return nil
        }// if it is true no more further initialization happens
        self.minQuantity = minQuantity
        super.init(name: name)
    }
}//if you delegate to another initializer that causes initialization to fail, the entire initialization process fails immediately, and no further initialization code is executed.

var class1 = Offer(name: "", minQuantity: 6)
if class1?.name != nil
{
    print("Your order is placed: Item name: \(class1!.name) and Quantity: \(class1!.minQuantity)")
}
else{
    print("Item name is needed to purchase item, so order is not valid")
}

var class2 = Offer(name: "Shoe", minQuantity: 1)

if class2?.minQuantity != nil
{
    print("Your order is placed: Item name: \(class2!.name) and Quantity: \(class2!.minQuantity)")
}
else
{
    print("Minimum quantity is 2 or more, so offer is not valid")
}


// required initializer
//Write the required modifier before the definition of a class initializer to indicate that every subclass of the class must implement that initializer

// def (KP) - If I have a subClass classB of  classA, if classB doesn't have it's own designated init then it will inherit it's parent's init. But if I declare init for classB then it may or may not have all the inits of it's parent. to avoid this case I can add required.

class MainClass
{
    var num1: Int
    required init()
    {
        num1 = 1
    }
}

class ChildClass: MainClass
{
    var num2: Int 
    init(num2: Int)
    {
        self.num2 = num2
    }
    required init() { // it tells that every subclass should use required
        num2 = 2
    }
}

var class5 = ChildClass()
class5.num2
class5.num1



class MainClass1
{
    var num1: Int
    required init()
    {
        num1 = 1
    }
}

class ChildClass1: MainClass1
{
    var num2: Int = 2
}

var class8 = ChildClass1()
class8.num2
class8.num1 // You don’t have to provide an explicit implementation of a required initializer if you can satisfy the requirement with an inherited initializer.

// Overriding failable initializer

class Class
{
    var name: String
    init()
    {
        name = "Unname"
    }
    init!(name: String)
    {
        if name.isEmpty
        {
            return nil
        }
        self.name = name
    }
}

var class4 = Class(name: "")
if class4?.name == nil{
    print("String is nil")
}
else{
    print("\(class4!.name)")
}
class Subclass: Class
{
    override init(name: String) // ovveriding failable initializer by non failable initializer
    {
        if name.isEmpty
        {
            super.init()
        }
        else{
            super.init(name: name)
        }
    }
}

var class3 = Subclass(name: "")
print(class3.name)

//Setting a Default Property Value with a Closure or Function
struct Box
{
    var boundary: [Int] = {
        var temp: [Int] = []
        for i in 0...3
        {
            for j in 0...3
            {
                if j == 0 || j == 3 || i == 0 || i == 3           {
                    temp.append(1)
                }
                else
                {
                    temp.append(0)
                }
            }
        }
        return temp
    }()
    func display() -> Void
    {
        for i in 0...3
        {
            for j in 0...3
            {
                print(boundary[i * 4 + j], terminator: " ")
            }
            print()
        }
    }
    
}

var struct1 = Box()
struct1.display()
