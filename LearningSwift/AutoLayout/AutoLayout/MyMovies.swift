//
//  MyMovies.swift
//  AutoLayout
//
//  Created by Dennis Silva on 04/11/18.
//  Copyright © 2018 Curso iOS. All rights reserved.
//

import UIKit

class MyMovies : UITableViewController{
    
    var meusfilmes : [Filme] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        var filme : Filme
        filme = Filme(title: "Filme 1", description: "Descrição 1", thumbnail: #imageLiteral(resourceName: "filme7"))
        meusfilmes.append(filme)
        filme = Filme(title: "Filme 2", description: "Descrição 2", thumbnail: #imageLiteral(resourceName: "filme2"))
        meusfilmes.append(filme)
        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meusfilmes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filme : Filme = meusfilmes[indexPath.row]
        let cel = tableView.dequeueReusableCell(withIdentifier: "reuse", for: indexPath) as! CelTable
        cel.filmeDesc.text = filme.descricao
        cel.filmeTitulo.text = filme.titulo
        cel.filmeImagem.image = filme.image
//        cel.textLabel?.text = filme.titulo
//        cel.imageView?.image = filme.image
        return cel
    }
}
