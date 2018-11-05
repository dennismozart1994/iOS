//
//  ResultadoViewController.swift
//  AutoLayout
//
//  Created by Dennis Silva on 03/11/18.
//  Copyright © 2018 Curso iOS. All rights reserved.
//

import UIKit

class ResultadoViewController: UIViewController {
    var resultado: Int!
   
    @IBOutlet weak var coinImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if resultado == 0{
            coinImage.image = #imageLiteral(resourceName: "moeda_cara")
        }
        else{
            coinImage.image = #imageLiteral(resourceName: "moeda_coroa")
        }
        // Do any additional setup after loading the view.
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
