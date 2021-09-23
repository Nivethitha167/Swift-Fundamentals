//
//  Class10.swift
//  Framework10
//
//  Created by Nivethitha on 06/09/21.
//

import Foundation
open class User {
    open var name: String
    public init(name: String) {
        self.name = name
    }
    public func publicFunc() {
        print("Public Func")
    }
    open func openFunc() {
        print("Open Func")
    }
    /*open final func finalFunc() { //Instance method cannot be declared both 'final' and 'open'
        print("Main Class Final Function")
    }*/
    required public init() { //Ask to define public explicitly
        self.name = "ABCD"
    }
    final func finalFunc() {
        print("Final Func")
    }
    /*open convenience init(age: Int) { //Only classes and overridable class members can be declared 'open'; use 'public'
        
     }*/
}

//--------------------------------------------
internal var temp1 = User(name: "jhvfkuraf")
public var temp2 = User(name: "jhvfkuraf")

class Student {
    public var name = "jfwjf"
}

//public var ab = Student() //Variable cannot be declared public because its type 'Student' uses an internal type

//-----------------------------------------

/*

//Module1---
/*open class User1 {
    open var name: String
    open init(name: String) { //Error: only classes and overridable class members can be declared 'open'; use 'public' 
        self.name = name
    }
}*/

//Module1----
open class User2 {
    open var name: String
    public init(name: String) { 
        self.name = name
    }
}

*/

