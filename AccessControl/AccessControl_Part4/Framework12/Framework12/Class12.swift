//
//  Class12.swift
//  Framework12
//
//  Created by Nivethitha on 08/09/21.
//

import Foundation

public class Student {
    private var name: String
    public init(name: String) {
        self.name = name
    }
}

extension Student {
    private func display() {
        print(name)
    }
}

/*internal */extension Student {
    public func callDisplay() { //warning - 'public' modifier conflicts with extension's default access of 'internal'
        display()
    }
}

private extension Student { //private extension is same as fileprivate extension
    func show() {
        print("Student")
    }
    /*fileprivate*/ var age: Int { //'fileprivate' modifier is redundant for property declared in a private (equivalent to fileprivate) extension
        return 10
    }
    private var age1: Int {
        return 12
    }
}

public var student1 = Student(name: "Vimala")

class Temporary {
    func call() {
        print(student1.age) // No error because of file private
        //print(student1.age1) //'age1' is inaccessible due to 'private' protection level
    }
}
//----------------------------------------Type aliases-----


//public typealias temp1 = Temporary //Type alias cannot be declared public because its underlying type uses an internal type

fileprivate typealias temp2 = Temporary
//doc: A type alias can have an access level less than or equal to the access level of the type it aliases.



protocol Teaching {
    var subject: String {
        get
    }
}
public class Teacher {
    public var name: String
    public init(name: String) {
        self.name = name
    }
}

//internal extension Teacher: Teaching { //'internal' modifier cannot be used with extensions that declare protocol conformances
    

//doc: You can’t provide an explicit access-level modifier for an extension if you’re using that extension to add protocol conformance. Instead, the protocol’s own access level is used to provide the default access level for each protocol requirement implementation within the extension.


extension Teacher: Teaching {
    public var subject: String {
        get {
            return "CSE"
        }
    }
        
}

internal protocol Teaching1 {
    var subj: String {
        get
    }
}

private protocol Ageable {
    var age: Int {
        get
    }
}

public class Teacher1: Teaching1, Ageable {
    //fileprivate var subj: String = "CSE" //Property 'subj' must be declared internal because it matches a requirement in internal protocol 'Teaching1'
    //cant define the access level below the min of(class, protocol)
    
    public var subj: String = "CSE"
    //private var age = 40 //Property 'age' must be declared fileprivate because it matches a requirement in private protocol 'Ageable'
    
    fileprivate var age = 40
    //eventhough its private we have to use fileprivate for the min access level if min(type, protocol) is private
    
    private var name: String
    public init(name: String) {
        self.name = name
    }
    
}

//------------

private class New1 {
    
}
/*public class New2: New1 { //Class cannot be declared public because its superclass is internal
    
}*/

