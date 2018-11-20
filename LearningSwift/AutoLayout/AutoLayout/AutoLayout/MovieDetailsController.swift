//
//  MovieDetailsController.swift
//  AutoLayout
//
//  Created by Dennis Silva on 16/11/18.
//  Copyright © 2018 Curso iOS. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailsController : UIViewController{
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDescription: UILabel!
    
    var filme : Filme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // data from filme var passed through segue on the storyboard before
        detailImage.image = filme.image
        detailTitle.text = filme.titulo
        detailDescription.text = filme.descricao
        
    }
    
}
