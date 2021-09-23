//
//  AppDelegate.swift
//  App9
//
//  Created by Nivethitha on 03/09/21.
//

import Cocoa

fileprivate var var1 = 10
public var var2 = 20
var var3 = 30
var tuple = (var1, var2)

fileprivate var tuple1 = (var2, var3)

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        let emp2 = Employee2(name: "Emp2")
        //print(emp2.id) //'id' is inaccessible due to 'fileprivate' protection level - here Employee 2 is in viewController.swift
        print(emp2.age1, "In App Delegate")
        
        //let main2 = Main1() - error - Main1 is in viewController (fileprivate) so we cant access its public memeber title
        
        //-------Nested types-----
        let par1 = Parent.Child1()
        print(par1)
        
        //let par2 = Parent.Child2() //'Child2' is inaccessible due to 'fileprivate' protection level
        //print(par2)
        
        let par3 = Parent.Child3() // Child3 - inernal - ViewController - another source file
        print(par3)
        
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

