//
//  RealmObjects.swift
//  RealmDemo
//
//  Created by pari on 12/10/17.
//  Copyright © 2017 pari. All rights reserved.
//

import Foundation
import RealmSwift

class User : Object{
    @objc dynamic var name : String? = nil
    var age = RealmOptional<Int>()

}

extension User{
    func writeToRealm(){
        try! uiRealm.write {
            uiRealm.add(self)
        }
    }
    
    func readFromRealm(){
//        print(uiRealm.objects(User.self))
        let data = uiRealm.objects(User.self)
        try! uiRealm.write {
            print(data)
        }
    }
    
}
