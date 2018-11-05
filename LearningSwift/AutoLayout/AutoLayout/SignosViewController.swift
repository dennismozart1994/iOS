//
//  SignosViewController.swift
//  AutoLayout
//
//  Created by Dennis Silva on 03/11/18.
//  Copyright © 2018 Curso iOS. All rights reserved.
//

import UIKit

class SignosViewController: UITableViewController {

    var signos : [String] = []
    var significadoSignos : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure signos
        signos.append("Áries")
        signos.append("Touro")
        signos.append("Gêmeos")
        signos.append("Câncer")
        signos.append("Leão")
        signos.append("Virgem")
        signos.append("Libra")
        signos.append("Escorpião")
        signos.append("Sargitário")
        signos.append("Capricórnio")
        signos.append("Aquário")
        signos.append("Peixes")
        
        // configure signos meaning
        significadoSignos.append("Ariano é um ser do bem")
        significadoSignos.append("Touro tem chifre")
        significadoSignos.append("Gêmeos se parecem mesmo")
        significadoSignos.append("Câncer é 13")
        significadoSignos.append("Leão é o rei da selva")
        significadoSignos.append("Virgem é um dos signos")
        significadoSignos.append("Libra é a moeda inglesa")
        significadoSignos.append("Escorpião tem veneno")
        significadoSignos.append("Sargitário é o Saint Seya")
        significadoSignos.append("Capricórnio morreu pro Shiryu")
        significadoSignos.append("Aquário era o mestre do Yoga")
        significadoSignos.append("Peixes, prefiro nem comentar")
        
        // Do any additional setup after loading the view.
    }
    
    // Sections ammount
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Rows ammount
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signos.count
    }
    
    // Build table with array values
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        cel.textLabel?.text = signos[indexPath.row]
        return cel
    }
    
    // If one line is clicked
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // create alert
        let alert = UIAlertController(title: "Significado do signo", message: significadoSignos[indexPath.row], preferredStyle: .alert)
        // create alert buttons
        let button = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        // add buttons to alert
        alert.addAction(button)
        
        // show alert
        present(alert, animated: true, completion: nil)
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
