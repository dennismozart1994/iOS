//
//  ViewController.swift
//  PrimeiroApp
//
//  Created by Dennis Silva on 21/10/18.
//  Copyright © 2018 Curso iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alcoolprice: UITextField!
    @IBOutlet weak var gasolineprice: UITextField!
    @IBOutlet weak var labelResult: UILabel!
    
    // Math
    @IBAction func calculateResult(_ sender: Any) {
            if let precoAlcool = alcoolprice.text {
                if let precoGasolina = gasolineprice.text{
                  let resultado = self.validacampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                    if resultado {
                        labelResult.text = calcula(alcool: precoAlcool, gasolina: precoGasolina)
                    }
                    else{
                        labelResult.text = "Digite os preços para calcular!"
                    }
                }
            }
    }
    
    
    func validacampos(precoAlcool: String, precoGasolina: String)->Bool{
        var camposValidados = true
        
        if precoAlcool.isEmpty || precoGasolina.isEmpty{
            camposValidados = false
        }
        
        return camposValidados
    }
    
    // calcula dados
    func calcula(alcool: String, gasolina: String)->String{
        var EndResult = "Existem campos em branco"
        if let valorAlcool = Double(alcool){
            if let valorGasolina = Double(gasolina){
                let resultado = valorAlcool / valorGasolina
                if resultado >= 0.7{
                    EndResult = "Melhor utilizar Gasolina!"
                }else{
                    EndResult = "Melhor utilizar Álcool!"
                }
            }
        }
        return EndResult
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

