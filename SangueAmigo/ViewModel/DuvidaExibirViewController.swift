//
//  DuvidaExibirViewController.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 13/05/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit

class DuvidaExibirViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var informacaoService : InformacaoService!
    var informacoes : Array<Informacao> = Array<Informacao>()
    @IBOutlet weak var tblView: UITableView!
    var tipo : String!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        informacaoService =  InformacaoService()
        informacoes = Array<Informacao>()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        listarInformacoes()
      
    }
    
    
    func  listarInformacoes(){
        let callback = { (_ informacoes :Array<Informacao>?, error:Error?) -> Void in
            if error != nil {
                print("Erro")
                
            } else if let informacoes = informacoes {
                self.informacoes = informacoes
                self.tblView.reloadData()
            }
        }
        
        
        informacaoService.list(tipo, callback)
    }
  

    @IBAction func clickOnBackBtn(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return self.informacoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        // Cria a célula desta linha
        let cell = tableView.dequeueReusableCell(withIdentifier: "duvidaCellView", for: indexPath) as! DuvidaCellViewController
        let linha = (indexPath as NSIndexPath).row
        
        // Objeto do tipo carro
        let informacao = self.informacoes[linha]
        cell.label.text = informacao.tipo
        cell.foto.image = UIImage(named: informacao.url!)
        cell.texto.text = informacao.info
        return cell
    }
}
