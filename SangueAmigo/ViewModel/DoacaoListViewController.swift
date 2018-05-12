//
//  DoacaoListViewController.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 28/04/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit

class DoacaoListViewController :  UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var estadoSelecionado : Int?
    var cidadeSelecionada : Int?
    var clinicas : Array<Clinica> = []
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var backButton:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listarClinicas()
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func  listarClinicas(){
        let _:ClinicaService = ClinicaService()
        _ = { (_ clinicas:Array<Clinica>?, error:Error?) -> Void in
            
            if error != nil {
                print("Error")
            } else if let clinicas = clinicas {
                
                self.clinicas = clinicas
                self.tblView.reloadData()
                
            }
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let linha = indexPath.row
        let clinica = self.clinicas[linha]
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DoacaoDetalhesViewController") as! DoacaoDetalhesViewController
        newViewController.clinica = clinica
        newViewController.clinicas = clinicas
        self.present(newViewController, animated: true, completion: nil)
    }
}

