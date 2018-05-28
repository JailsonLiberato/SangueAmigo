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
            self.view.removeBluerLoader()
        }
        
        
        informacaoService.list(tipo, callback)
    self.view.showBlurLoader()
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
        let informacao = self.informacoes[linha]
        cell.label.text = informacao.tipo
        cell.foto.image = UIImage(named: informacao.url!)
        cell.texto.text = informacao.info
        return cell
    }
}

extension UIView{
    func showBlurLoader(){
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.startAnimating()
        
        blurEffectView.contentView.addSubview(activityIndicator)
        activityIndicator.center = blurEffectView.contentView.center
        
        self.addSubview(blurEffectView)
    }
    
    func removeBluerLoader(){
        self.subviews.flatMap {  $0 as? UIVisualEffectView }.forEach {
            $0.removeFromSuperview()
        }
    }
}
