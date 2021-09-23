//
//  ViewController.swift
//  App9
//
//  Created by Nivethitha on 03/09/21.
//

import Cocoa
import Framework9

//class Employee1: Person1 // error - Cannot inherit from non-open class 'Person1' outside of its defining module - Person1 - public
class Employee2: Person2 { // Person2 - open
    var name1: String = "qwwr"
    var age1: Int = 100
    override var name: String {
        get {
            return "jvfgewvf"
        }
        set {
            name1 = newValue
        }
    }
    fileprivate var id = 1001
    /*override var age: Int { //Property does not override any property from its superclass
        get {
            return 200
        }
        set {
            age = newValue
        }
    }*/
}

//--------------------------
fileprivate class Main1 {
    public var title = "Main"
    public init(title: String) {
        self.title = title
    }
}

//---------------------------

public class Parent {
    class Child1 {
        
    }
    fileprivate class Child2 {
        
    }
    internal class Child3 {
        
    }
}

/*open struct Information { //Only classes and overridable class members can be declared 'open'; use 'public'
    
}*/


class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(num1)
        //print(num2) //Cannot find 'num2' in scope - it is internal in framework module
        
        let pers1 = Person1(name: "Nive")
        //print(pers1.name) //'name' is inaccessible due to 'internal' protection level
        print(pers1.age)
        
        let pers2 = Person2(name: "Nivethitha")
        print(pers2.age)
        pers2.disp()
        
        //let cse2 = CSEStudent(name: "Nive") //Cannot find 'CSEStudent' in scope - CSEStudent is private in framework module
        //print(cse2)
        
        let main = Main(title: "Main Class")
        //print(main.cse) //'cse' is inaccessible due to 'fileprivate' protection level
        print(main)
        
        //----------tuples defined in framework class-------
        print("-----------")
        print(tuple.0)
        //print(tuple1.0)  tuple1 is file private in Appdelegate
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

