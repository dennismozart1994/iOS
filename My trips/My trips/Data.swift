//
//  Data.swift
//  My trips
//
//  Created by Dennis Silva on 19/11/18.
//  Copyright © 2018 Curso iOS. All rights reserved.
//

import UIKit

class Data{
    
    let key = "Trips"
    var spots: [ Dictionary<String, String> ] = []
    
    
    func getDefaults() -> UserDefaults{
        return UserDefaults.standard
    }
    
    func SaveTrip(trip: Dictionary<String, String>){
        spots = ListTrip()
        spots.append(trip)
        getDefaults().set(spots, forKey: key)
        getDefaults().synchronize()
    }
    
    func ListTrip() -> [Dictionary<String, String>]{
       let data = getDefaults().object(forKey: key)
        if data != nil{
            return data as! Array
        }else{
            return []
        }
    }
    
    func DeleteTrip(index: Int){
        spots = ListTrip()
        spots.remove(at: index)
        
        getDefaults().set(spots, forKey: key)
        getDefaults().synchronize()
    }
}
