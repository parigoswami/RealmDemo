//
//  ViewController.swift
//  RealmDemo
//
//  Created by pari on 12/10/17.
//  Copyright © 2017 pari. All rights reserved.
//

import UIKit
import FirebaseDatabase
import RealmSwift

class TableViewController : UITableViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        grabData()
        fetchData()
    }
    
    func fetchData(){
        let userData = User()
        userData.readFromRealm()
        
        
    }
    
    func grabData(){
        let databaseRef = Database.database().reference()
        databaseRef.child("users").observe(.value) {
            snapshot in
            for snap in snapshot.children.allObjects as! [DataSnapshot]{
                guard let dict = snap.value as? [String:AnyObject] else{
                    return
                }
                let name = dict["name"] as? String
                let age = dict["age"] as? Int
                
                print(name!)
                print(age!)
                
                let UserToAdd = User()
                UserToAdd.name = name
                UserToAdd.age.value = age
                UserToAdd.writeToRealm()
                
            }
            
        }
    }
    
}

