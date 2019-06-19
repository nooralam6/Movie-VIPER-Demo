//
//  RealmDB.swift
//  MovieVIPERDemo
//
//  Created by new on 19/06/19.
//  Copyright © 2019 Sunday Mobility. All rights reserved.
//

import Foundation
import RealmSwift

class RealmDB {
    static let shared = RealmDB()
    let realm = try! Realm()
    
    init() {
        
    }
    
    func saveToRealmList<T: Object>(obj:List<T>, append: Bool){
        if(!obj.isInvalidated || obj.realm != nil){
            try! realm.write {
                
                if !append {
                    realm.delete(realm.objects(T.self))
                }
                for item in obj{
                    realm.add(item, update: true)
                }
                
            }
        }
    }
    
    func saveToRealmObj<T:Object>(obj:T, append: Bool){
        if(!obj.isInvalidated || obj.realm != nil){
            try! realm.write {
                if !append{
                    realm.delete(realm.objects(T.self))
                }
                realm.add(obj, update: true)
            }
        }
    }
    
    func retreiveFromRealm<T:Object>(objType:T) -> List<T>{
        let array = realm.objects(T.self)
        let convertedList = List<T>()
        convertedList.append(objectsIn: array)
        return convertedList
    }
    
    func deleteDataFromRealm<T:Object>(obj:T){
        try! realm.write {
            realm.delete(realm.objects(T.self))
        }
    }
    
    func deleteAllDataFromRealm(){
        if realm.isInWriteTransaction {
            realm.cancelWrite()
        }
        try! realm.write {
            realm.deleteAll()
        }
        realm.refresh()
        
    }
    
    func deleteAll(except types: Object.Type...) {
        if realm.isInWriteTransaction {
            realm.cancelWrite()
        }
        
        try! realm.write {
            realm.configuration.objectTypes?.filter{ type in types.contains{ $0 == type } == false}.forEach{ objectType in
                realm.delete(realm.objects(objectType.self))
            }
        }
    }
    
    func replaceRealmListData<T:Object>(objType:T, index:Int){
        let array = realm.objects(T.self)
        let convertedList = List<T>()
        convertedList.append(objectsIn: array)
        convertedList.replace(index: index, object: objType)
        DLog(message: convertedList)
        saveToRealmList(obj: convertedList, append: false)
    }
}
