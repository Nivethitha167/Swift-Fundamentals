//
//  ViewController.swift
//  App10
//
//  Created by Nivethitha on 06/09/21.
//

import Cocoa
import Framework10

//-------Function types--------

private var num1 = 10
internal var num2 = 20

/*private*/ func add(num1: Int, num2: Int) -> (Int, Int, Int){
    print(num1 + num2)
    return (num1, num2, (num1 + num2))
}

//--------Enumeration types-------
enum Planet {
    case earth
    //private case Mars //'private' modifier cannot be applied to this declaration
    //doc: You can’t specify a different access level for individual enumeration cases.
    case jupiter
    case uranus
    
}

internal enum Week: Int {
    //case sunday = 0 //'private' modifier cannot be applied to this declaration
    case sunday = 0
    case monday = 1
    case tuesday = 2
}
//public var new = Week.sunday //Variable cannot be declared public because its type 'Week' uses an internal type

fileprivate var new = Week.sunday
private var new1 = Week.sunday

//doc: The types used for any raw values or associated values in an enumeration definition must have an access level at least as high as the enumeration’s access level. For example, you can’t use a private type as the raw-value type of an enumeration with an internal access level.

enum Details {
    case id(Int)
    case emp(String, String)
}

//public var detail = Details.id(100)  //Variable cannot be declared public because its type 'Details' uses an internal type
 fileprivate var detail = Details.id(100)

//-----------------------------Initializing in class--------------------
class SubUser: User {
    override init(name: String) {
        super.init(name: name)
    }
    required init() {
        super.init(name: "EFGH")
    }
    /*override func finalFunc() { //Method does not override any method from its superclass
        
    }*/
    override func openFunc() {
        
    }
    /*
    override func publicFunc() { //Overriding non-open instance method outside of its defining module
        
    }*/
}

var user1 = SubUser(name: "bduyaegfu")
class SubUser2: User {
    override init(name: String) {
        super.init(name: name)
    }
    required init() {
        super.init(name: "IJKL")
    }
    
}
var user2 = SubUser2(name: "hdsvfudgku")

//---------------Initializing in structure------------
struct College { //internal
    private var noOfStu: Int
    public var noOfDept: Int
}

//var clg = College(noOfStu: 1000, noOfDept: 10) //'College' initializer is inaccessible due to 'private' protection level

//doc: The default memberwise initializer for a structure type is considered private if any of the structure’s stored properties are private.


class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //print(temp1.name) //Cannot find 'temp1' in scope
        print(temp2.name)
        
        //let fem = Female(name: "hvfhgkf")
        //print(fem.name)

        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

/*
//-------Module2
class Female: User2 {
    override init(name: String) { //overrides public init in superclass
        super.init(name: name)
    }
}

*/
