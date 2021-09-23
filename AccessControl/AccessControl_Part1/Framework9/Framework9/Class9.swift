//
//  Class9.swift
//  Framework9
//
//  Created by Nivethitha on 03/09/21.
//

import Foundation

public var num1 = 10 // explicitly public

var num2 = 20 // Implicitly internal

public class Person1 { // public
    var name: String // implicitly internal
    //doc - A public type defaults to having internal members, not public members. If you want a type member to be public, you must explicitly mark it as such.
    
    public var age: Int = 10
    public init(name: String) {
        self.name = name
    }
    func show() {
        print("Person1")
    }
}
//-------------------------------------------
//internal class Emp1: Person1 { // valid
public class Emp1: Person1 { 
    internal override init(name: String) {
        super.init(name: name)
    }
    public override func show() {
        print("Emp1")
    }
}

class User {
    
}
/*
public class Emp2: User { //Cannot inherit from non-open class 'Person1' outside of its defining module - Not valid
    
}
 */

//doc: A subclass can’t have a higher access level than its superclass—for example, you can’t write a public subclass of an internal superclass.

//-----------------------------------------

open class Person2 { // open
    open var name: String
    
    public var age = 10
    /*init(name: String) { // implicitly inetrnal
        self.name = name
    }*/
    public init(name: String) {
        self.name = name
    }
    /*open init(name: String) { //Only classes and overridable class members can be declared 'open'; use 'public'
        self.name = name
    }*/
    open func disp() {
        print("Person2")
    }
}


//-----------------------------------------
private class Student {
    public var name: String
    public init(name: String) {
        self.name = name
    }
}

//class CSEStudent: Student { //Class must be declared private or fileprivate because its superclass is private
private class CSEStudent: Student {
    override init(name: String) {
        super.init(name: name)
    }
}
//var cse1 = CSEStudent(name: "Nive") //Variable must be declared private or fileprivate because its type 'CSEStudent' uses a private type

private var cse1 = CSEStudent(name: "Nive")

public class Main {
    fileprivate var cse = CSEStudent(name: "gvgaev")
    public var title = "Main"
    public init(title: String) {
        self.title = title
    }
}

//----------------------------------
fileprivate class Main1 {
    fileprivate var cse = CSEStudent(name: "gvgaev")
    public var title = "Main"
    public init(title: String) {
        self.title = title
    }
}

//---------------------------------
/* Refer notes for tuples */
