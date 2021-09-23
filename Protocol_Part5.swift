// Checking for protocol Conformance
import Foundation
protocol Growable
{
    func grow()
}

class Tree: Growable
{
    func grow() {
        print("All Trees grow day by day")
    }
    
    func grow(name: String) {
        print("\(name) is growing day by day")
    }
}

class Rock
{
    func degrade()
    {
        print("Degrade gradually to form sand")
    }
}

var tree1 = Tree()

tree1.grow()
tree1.grow(name: "Neem")

var rock1 = Rock()

var arr: [AnyObject] = [tree1, rock1]

for i in arr
{
    if i is Growable
    {
        print("True, \(type(of: i))")
    }
    else{
        print("false \(type(of: i))")
    }
}

for ele in arr
{
    if let temp = ele as? Growable
    {
        temp.grow()
    }
    else{
        print("This is not growable")
    }
}

// Optional protocol Requirements

@objc protocol Protocol // @objc asks to import Foundation
{
    @objc optional func display(age: Int) -> Int //
    @objc optional var id: Int{
        get
    }
}

class Class1: Protocol
{
    func display(age: Int) -> Int {
        return age + 10
    }

}
var class1: Protocol?

if let temp = class1?.display?(age: 5)
{
    print(temp)
}
else{
    print("class1 is nil")
}

class1 = Class1()

if let temp = class1?.display?(age: 5)
{
    print(temp)
}
else{
    print("In class1 there is no display func")
}

class Class2: Protocol
{
    var id: Int = 500
}
var class2: Protocol?

if let temp = class2?.id
{
    print(temp)
}
else{
    print("class2 is nil")
}

class2 = Class2()
if let temp = class2?.id
{
    print(temp)
}
else{
    print("In class2 there is no id")
}

if let temp = class2?.display?(age: 5)
{
    print(temp)
}
else{
    print("In class2 there is no display func")
}

// Protocol Extensions

protocol Rotating
{
    func rotate() -> Bool
}

extension Rotating
{
    func rotate() -> Bool
    {
        return true
    }
}

//Providing Default Implementations

class Turbine: Rotating
{
    var obj: String = "Unnamed"
}

var turb1 = Turbine()
print(turb1.rotate()) // true



class Wheel: Rotating
{
    func rotate() -> Bool
    {
        return false
    }
}

var wheel1 = Wheel()
print(wheel1.rotate()) //false

//doc: "If a conforming type provides its own implementation of a required method or property, that implementation will be used instead of the one provided by the extension."


protocol Rotating1
{
    var obj: String{
        get set
    }
    init(obj: String)
    init()
}
//providing default implementation
extension Rotating1
{
    init(obj: String)
    {
        self.init()
        self.obj = obj
        
    }
}



class Turbine1: Rotating1
{
    var obj: String
    required init()
    {
        self.obj = "unnamed"
    }
}

var turb2 = Turbine1(obj: "Turbine")
turb2.obj //Turbine

struct Turbine2: Rotating1
{
    var obj: String
    init()
    {
        self.obj = "unnamed"
    }
}

var turb3 = Turbine2(obj: "Turbine")
turb3.obj //Turbine
