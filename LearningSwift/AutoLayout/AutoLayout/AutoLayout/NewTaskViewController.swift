//
//  NewTaskViewController.swift
//  AutoLayout
//
//  Created by Dennis Silva on 17/11/18.
//  Copyright © 2018 Curso iOS. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {

    @IBOutlet weak var taskfield: UITextField!
    
    @IBAction func addTaskButton(_ sender: Any) {
        if let inputText = taskfield.text{
            let Tasks = TaskUsersDefault()
            Tasks.save(task: inputText)
            taskfield.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
