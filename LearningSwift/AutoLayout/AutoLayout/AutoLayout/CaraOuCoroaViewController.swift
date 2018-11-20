//
//  CaraOuCoroaViewController.swift
//  AutoLayout
//
//  Created by Dennis Silva on 03/11/18.
//  Copyright © 2018 Curso iOS. All rights reserved.
//

import UIKit

class CaraOuCoroaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result"{
            let data = segue.destination as! ResultadoViewController
            data.resultado = Int(arc4random_uniform(2))
        }
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
