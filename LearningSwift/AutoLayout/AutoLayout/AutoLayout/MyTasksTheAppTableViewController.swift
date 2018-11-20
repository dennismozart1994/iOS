//
//  MyTasksTheAppTableViewController.swift
//  AutoLayout
//
//  Created by Dennis Silva on 17/11/18.
//  Copyright © 2018 Curso iOS. All rights reserved.
//

import Foundation
import UIKit

class MyTasksTheAppTableViewController : UITableViewController{
    
    var tasks: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Enable delete option on a table view
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // check if option is delete
        if editingStyle == UITableViewCell.EditingStyle.delete{
            let task = TaskUsersDefault()
            task.removeItem(index: indexPath.row)
            updateTableList()
        }
        
    }
    
    // update table
    func updateTableList(){
        let task = TaskUsersDefault()
        tasks = task.list()
        tableView.reloadData()
    }
    
    // Change text from delete button
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Apagar"
    }
    
    // function that is thrown everytime the screen appears
    override func viewDidAppear(_ animated: Bool) {
        updateTableList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // amount of columns
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // amount of rows of the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    // config each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuse", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
}
