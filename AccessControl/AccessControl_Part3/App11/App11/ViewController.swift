//
//  ViewController.swift
//  App11
//
//  Created by Nivethitha on 07/09/21.
//

import Cocoa
import Framework11

//-----------Protocols--------
class People1: Identifiable {
    var name: String
    var adharNo: Int
    init(name: String, adharNo: Int) {
        self.name = name
        self.adharNo = adharNo
    }
    
}

/*
 extension People2 { //Cannot find type 'People2' in scope
    //People2 is public but conforms to internal protocol
}
 */




class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // let ppl1 = People2() //Cannot find 'People2' in scope
        // here People2 conforms to internal Identifiable protocol...though people2 is public it wont work
        
        //doc:The context in which a type conforms to a particular protocol is the minimum of the type’s access level and the protocol’s access level. For example, if a type is public, but a protocol it conforms to is internal, the type’s conformance to that protocol is also internal.
        //-----------------------------
        
        print(name1) // internal person with public name assigned to public var in another module
        
        let pers3 = Person2()
        print(pers3.name)
        pers3.name = "setting name of fileprivate set(name) in same sourse file"
        print(pers3.name, "---")
        print(pers3.age)
        //pers3.age = 600 //Cannot assign to property: 'age' setter is inaccessible
        pers3.computedAge = 700
        print(pers3.age)
        
        print(pers3.observer)
        pers3.observer = "String1"
        pers3.observer = "String2"
        
        print(pers3[0])
        
        print(temp1)
        print(temp2)
        print(temp3)
        print(temp4)
        
        
        
        //-----------------

        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}
//-----------------------
fileprivate var id1 = 100
struct User<Type> {
    var id: Type
}
let user1 = User(id: id1)
//---------------------


//--------------------------Properties, subcripts-------
public class Person2 {
    fileprivate(set) var name = "Person2"
    fileprivate private(set) var age = 500
    internal fileprivate(set) var computedAge: Int {
        get {
            return age
        }
        set {
            age = newValue
            print("Age is changed")
        }
    }
    fileprivate(set) internal var observer: String = "Empty" {
        didSet {
            print("Old value is \(oldValue)")
        }
        willSet {
            print("NewValue is \(newValue)")
        }
        
    }
    var arr = ["Male", "Female", "Child"]
    fileprivate subscript(ind: Int) -> String {
        return arr[ind]
    }
    
}

//--------------generics------------------




