//
//  DoacaoListViewController.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 28/04/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit

class DoacaoListViewController :  UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var clinicas : Array<Clinica> = []
    @IBOutlet weak var tblView: UITableView!
    
    let dogs = ["Pastor Alemão","Pastor Belga","Pastor de Brie",
                "Pastor dos Pirenéus de Cara Rosa","Pequinês",
                "Perdigueiro","Pitbull","Podengo","Pointer","Pug"]


    override func viewDidLoad() {
        let clinicaService:ClinicaService = ClinicaService()
        let callback = { (_ clinicas:Array<Clinica>?, error:Error?) -> Void in
            
            if let error = error {
                
               // Alerta.alerta("Erro: " + error.localizedDescription, viewController: self, action: nil)
                print("Error")
            } else if let clinicas = clinicas {
                
                self.clinicas = clinicas
                self.tblView.reloadData()
                
            }
        }
        clinicaService.list("Pernambuco", cidade:"Recife",callback)
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return self.clinicas.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        // Cria a célula desta linha
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! DoacaoCellViewController
        let linha = (indexPath as NSIndexPath).row
        
        // Objeto do tipo carro
        let clinica = self.clinicas[linha]
        cell.label.text = clinica.nome
        cell.foto.image = UIImage(named: clinica.foto!)
        return cell
    }
    
}
