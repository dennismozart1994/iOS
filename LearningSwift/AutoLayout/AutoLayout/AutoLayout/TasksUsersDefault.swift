//
//  TasksUsersDefault.swift
//  AutoLayout
//
//  Created by Dennis Silva on 17/11/18.
//  Copyright © 2018 Curso iOS. All rights reserved.
//

import UIKit

class TaskUsersDefault{
    
    let key = "TaskList"
    var List: [String] = []
    
    func save(task: String){
        
        // Retrieve other tasks before add the new one
        List = list()
        
        // Save new Task
        List.append(task)
        UserDefaults.standard.set(List, forKey: key)
    }
    
    // list data saved from the user
    func list() -> Array<String> {
        // retrieve the data from the key
       let data = UserDefaults.standard.object(forKey: key)
        // chec if data isn't null, then return as an array
        if data != nil{
            return data as! Array<String>
        }else{
            return []
        }
    }
    
    // delete data
    func removeItem(index: Int){
        // Retrieve other tasks before add the new one
        List = list()
        
        // Remove data and then save again
        List.remove(at: index)
        UserDefaults.standard.set(List, forKey: key)
    }
}
