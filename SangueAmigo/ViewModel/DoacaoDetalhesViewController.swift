//
//  DoacaoDetalhesViewController.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 29/04/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit

class DoacaoDetalhesViewController : UIViewController{
    
    @IBOutlet var nome :UILabel?
    @IBOutlet var fotoPrincipal: UIImageView?
    @IBOutlet var telefone : UIButton?
    @IBOutlet var horario : UILabel?
    @IBOutlet var endereco : UILabel?
    @IBOutlet var mapa: UIImageView!
    var clinicas : Array<Clinica> = []
    
    
    var clinica:Clinica?
    
    override func viewDidLoad() {
        nome?.text = clinica?.nome
        fotoPrincipal?.image = UIImage(named: (clinica?.fotoPrincipal!)!)
        telefone?.setTitle(clinica?.telefone, for: UIControlState.normal)
        horario?.text = clinica?.horario
        endereco?.text = clinica?.endereco
        self.addBackbutton(title: "Voltar")
        self.title = ""
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.title = ""
    }
    @IBAction func ligar(_ sender: Any) {
        let urlCode = "tel://" + (telefone?.titleLabel?.text)!
        let url:NSURL = NSURL(string: urlCode)!
        UIApplication.shared.openURL(url as URL)
    }
    
    @IBAction func visualizarMapa(sender: UITapGestureRecognizer){
         let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MapaViewController") as! MapaViewController
        self.navigationController!.pushViewController(newViewController, animated: true)
    }
    
}
