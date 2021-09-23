// Collection of protocol types
protocol Flyable
{
    func fly() -> String
}

class Aeroplane: Flyable
{
    var from: String
    var to: String
    init(from: String, to: String)
    {
        self.from = from
        self.to = to
    }
    func fly() -> String {
         return "The aeroplane flies from \(from) to \(to)"
    }
}

class Rocket: Flyable
{
    var from: String
    var to: String
    init(from: String, to: String)
    {
        self.from = from
        self.to = to
    }
    func fly() -> String {
         return "The Rocket flies from \(from) to \(to)"
    }
}

var aero1 = Aeroplane(from: "Chennai", to: "Delhi")
var aero2 = Aeroplane(from: "Mumbai", to: "Delhi")

var rocket1 = Rocket(from: "Earth", to: "Mars")
var rocket2 = Rocket(from: "Earth", to: "Moon")

var arr1: [Flyable] = [aero1, aero2, rocket1, rocket2]
print(type(of: arr1)) //Array<Flyable>
var info = arr1[2].fly()
print(info)

//var arr2: Set<Flyable> // error - Type 'Flyable' does not conform to protocol 'Hashable'
//var arr2: [Flyable: String] // error - Type 'Flyable' does not conform to protocol 'Hashable'

var arr2: [String: Flyable] = ["Aeroplane1": aero1, "Aeroplane2": aero2, "Rocket1": rocket1]
print(arr2["Aeroplane1"]!.fly())

//Adopting a Protocol Using a Synthesized Implementation

struct Helicopter: Equatable
{
    var from: String
    var to: String
}

var heli1 = Helicopter(from: "Chennai", to: "Kolkata")
var heli2 = Helicopter(from: "Chennai", to: "Kolkata")

if heli1 == heli2
{
    print("They are from same source to dest")
}
else{
    print("They are not from same source to dest")
}

//doc: "Structures that have only stored properties that conform to the Equatable protocol"

//var arr3: Set<Helicopter> //error - Type 'Helicopter' does not conform to protocol 'Hashable'

//---------------------------------*******--------------------------------

extension Helicopter: Hashable
{
   //doc: "Structures that have only stored properties that conform to the Hashable protocol"

}

var arr3: Set<Helicopter> // Here no error - coz it conforms to hashable protocol now

var arr4: [Helicopter: Int] // Same here - no error

//----------------------------------*****-----------------------------------

enum Helicop: Equatable
{
    case from(source: String)
    case to(dest: String)
    case day
}

var helicop1 = Helicop.from(source: "Bangalore")
var helicop2 = Helicop.from(source: "Chennai")

if helicop1 == helicop2
{
    print("They are from same source ")
}
else{
    print("They are not from same source ")
}

//doc: Enumerations that have only associated types that conform to the Hashable protocol

//Protocol Inheritance-------------------
/*
class A
{
    
}
class B
{
    
}
class C: A, B{ // error - Multiple inheritance from classes 'A' and 'B'
    
}
 */
protocol Eatable
{
    func eat()
}

protocol Sleepable
{
    func sleep()
}
protocol Human: Eatable, Sleepable, AnyObject
{
    var name: String{
        get
    }
}

class Person: Human
{
    var name: String = "Kala"
    
    func eat() {
        print("\(name) eats three times a day")
    }
    
    func sleep() {
        print("\(name) sleeps 8 hrs a day")
    }
}

var person1 = Person()
person1.eat()

//------------------------------------------------

class Person1
{
    var name: String = "abc"
}

extension Person1: Eatable
{
    func eat() {
        "\(name) eats three times a day"
    }
    
}

/*extension Human: Flyable //Extension of protocol 'Human' cannot have an inheritance clause
{}
*/

//-------------------------------Class-Only Protocols-----------------

class Person2
{
    var name: String = "aaaa"
}

extension Person2: Human
{
    func eat() {
        print("Eating")
    }
    
    func sleep() {
        print("Sleeping")
    }
    
    
}

/*struct Person1: Human // error - Non-class type 'Person1' cannot conform to class protocol 'Human'
{
  // doc: You can limit protocol adoption to class types (and not structures or enumerations) by adding the AnyObject protocol to a protocol’s inheritance list.
 }
*/

print("-----------Protocol Composition------------")

func display(details: Eatable & Sleepable)
{
    details.eat()
    details.sleep()
}
var pers1 = Person()
display(details: pers1) //Person conforms to both eatable and sleepable

print("----------------------")


class Person3
{
    
     var name: String = "abc"
 }
 

class SubPerson: Person3, Eatable
{
    func eat() {
        print("eating")
    }
    
    var age = 10
}

func allDisplay(details: Person3 & Eatable)
{
    print(details.name)
    details.eat()
}

var subpers = SubPerson()

allDisplay(details: subpers)

//doc: "In addition to its list of protocols, a protocol composition can also contain one class type, which you can use to specify a required superclass."

//-----------Protocol inherits from class - tried ---------------

class Class1
{
    var age = 10
}

protocol Sample: Class1
{
    var name: String{
        get
    }
}

/*class Class2: Sample // error - 'Sample' requires that 'Class2' inherit from 'Class1'
{
    var name: String = ""

}*/

class Class2: Class1, Sample
{
    var name: String = "No Name"
    
}

/*struct struct1: Sample // error - Non-class type 'struct1' cannot conform to class protocol 'Sample'
{
    
}*/

//----------------------

import Foundation
@objc protocol SampleProto
{
    @objc optional func display()
    func show()
}

class Person5: SampleProto
{
    func show() {
        print("Person 5")
    }
}

/*struct Person6: SampleProto // error - Non-class type 'Person6' cannot conform to class protocol 'SampleProto'
{
   //doc: Note that @objc protocols can be adopted only by classes that inherit from Objective-C classes or other @objc classes. They can’t be adopted by structures or enumerations.
}
 */

//-------------------------------------------------------------------------------------

// default implentation - wont work - MULTIPLE PROTOCOLS WITH SAME FUNCTION NAME BUT DIFFER IN IMPLEMENTATION
protocol Protocol1
{
    func disp()
}

extension Protocol1{
    func disp()
    {
        print("This is First protocol")
    }
}

protocol Protocol2
{
    func disp()
}

extension Protocol2{
    func disp(){
        print("This is Second protocol")
    }
}

class Person6: Protocol1, Protocol2 // ERROR 1 - Type 'Person6' does not conform to protocol 'Protocol1'
{                                   // ERROR 2 - Type 'Person6' does not conform to protocol 'Protocol2'
    
    func disp()
    {
        print("Person6")
    }
}


//--------------------------------------------------
//default implementation wont work in another case

//Using generic where clause with extensions to a protocol

protocol Identity
{
    associatedtype type
    var name: type{
        get
    }
    var id: type{
        get
    }
    
    func showId() -> type
    func showName() -> type
}

extension Identity where type == String
{
    func showName() -> String
    {
        return name
    }
}

struct Persons<type>: Identity
{
    func showName() -> type // error - Type 'Persons<type>' does not conform to protocol 'Identity'
    {
        return name
    }
    // after adding above func no error - default implementation wont work even though if i put the type is of string
    func showId() -> type {
        return id
    }
    var name: type
    var id: type
}


//var persons1 = Persons(name: 1, id: 101)
//print(persons1.showId())


var pers2 = Persons(name: "Nive", id: "500")
print(pers2.showName())


//------------------------------------

func show(per: Protocol1) // (Protocol composition) // one case checking
{
    print("****")
}
show(per: Person6())
//--------------------------------------------
protocol InitProtocol
{
    init(name: String, id: String)
    
}

struct User: InitProtocol{
    var name: String // // Here it does not ask to mention init in struct because of default implementation
    var id: String
    //var name: String //Initializer 'init(id:name:)' has different argument labels from those required by protocol 'InitProtocol' ('init(name:id:)')
}
