//
//  storeDataViewController.swift
//  AutoLayout
//
//  Created by Dennis Silva on 16/11/18.
//  Copyright © 2018 Curso iOS. All rights reserved.
//

import Foundation
import UIKit

class storeDataViewController: UIViewController {
    
    let dataKey = "data"
    
    // Text area reference
    @IBOutlet weak var notationsText: UITextView!
    
    @IBAction func saveBtn(_ sender: Any) {
        UserDefaults.standard.set(notationsText.text, forKey: dataKey)
    }
    
    
    // Load app
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notationsText.text = getNotations()
        
        // Remove object saved
        // UserDefaults.standard.removeObject(forKey: "background")
    }
    
    
    // Get data Stored on device
    func getNotations() -> String{
        // Retrieved data stored
        if let dataSaved = UserDefaults.standard.object(forKey: dataKey){
            return dataSaved as! String
        }
        
        return ""
    }
    
    // hide status bar if true, shows if false
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // hides the keyboard whenever the user clicks out the text box/field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
