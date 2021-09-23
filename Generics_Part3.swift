//Associated Types
protocol Flyable
{
    associatedtype Obj
    associatedtype Bird
    var objName: Obj {
        get
    }
    var birdName: Bird
    {
        get
    }
    func objFly() -> Obj
    func birdFly() -> Bird
    
}


class FlyingClass<Obj, Bird>
{
    var birdName: Bird
    
    var objName: Obj
    func objFly() -> Obj {
        return objName
    }
    
    init(objName: Obj, birdName: Bird) {
        self.objName = objName
        self.birdName = birdName
    }

}

var class1 = FlyingClass(objName: "Aeroplane", birdName: "Sparrow")


var temp2 = class1.objFly()
print(temp2)
print(type(of: temp2))

//Extending an existing type to specify associated type

var temp3 = class1.birdFly() // func used before defined in extension
print(temp3)
print(type(of: temp3))

extension FlyingClass: Flyable
{
    func birdFly() -> Bird {
        return birdName
    }
    
}

var temp1 = class1.birdFly()
print(temp1)
print(type(of: temp1))

//Adding constraints to an associated type

protocol Growable
{
    associatedtype Obj: Hashable
    func grow(name: Obj) -> Obj
    
}

struct Leaves: Hashable
{
    var color: String
}

class Plant<Obj: Hashable>: Growable{
    var stru: Obj
    func grow(name: Obj) -> Obj {
        print(type(of: name))
        return name
    }
    init(stru: Obj)
    {
        self.stru = stru
    }
}

var plant2 = Plant(stru: Leaves(color: "Green"))// - error Generic class 'Plant' requires that 'Leaves' conform to 'Hashable'
print(plant2.grow(name: Leaves(color: "Brown")))
var plant1 = Plant(stru: "Neem")
print(plant1.grow(name: "Neem"))



//default implementation - protocol


protocol Xyz
{
    func function1()
    func function2()
}

class User: Xyz
{
    /*func function3(){
        print("FUNCTION3")
    }*/
}

extension Xyz
{
    func function1() {
        print("Function1")
    }
    func function2() {
        print("Function2")
    }
    
    func function3(){ // can also add new implementation of method in extension for protocol and it is defaullt one
        print("function3")
    }
}

var user1 = User()
user1.function1()
user1.function3()
