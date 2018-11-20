//
//  Filme.swift
//  AutoLayout
//
//  Created by Dennis Silva on 03/11/18.
//  Copyright © 2018 Curso iOS. All rights reserved.
//

import UIKit

class Filme{
    
    var titulo : String!
    var descricao : String!
    var image : UIImage!
    
    init(title : String, description : String, thumbnail : UIImage){
        self.titulo = title
        self.descricao = description
        self.image = thumbnail
    }
    
}
