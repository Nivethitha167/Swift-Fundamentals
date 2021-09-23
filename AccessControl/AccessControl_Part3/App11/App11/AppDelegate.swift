//
//  AppDelegate.swift
//  App11
//
//  Created by Nivethitha on 07/09/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        print("-------------------")
        let pers2 = Person2()
        print(pers2.name)
        
        //pers2.name = "setting name of fileprivate set(name) in another sourse file" //Cannot assign to property: 'name' setter is inaccessible
        
        //print(pers2.age) //'age' is inaccessible due to 'fileprivate' protection level
        
        print(pers2.observer)
       // pers2.observer = "Str1" //Cannot assign to property: 'observer' setter is inaccessible
        
        //print(pers2[0]) //'subscript' is inaccessible due to 'fileprivate' protection level
        
        //--------generic-------
        print(user1.id)
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

