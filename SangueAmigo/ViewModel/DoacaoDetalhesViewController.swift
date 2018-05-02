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
    
    
    var clinica:Clinica?
    
    override func viewDidLoad() {
        nome?.text = clinica?.nome
        fotoPrincipal?.image = UIImage(named: (clinica?.fotoPrincipal!)!)
        telefone?.setTitle(clinica?.telefone, for: UIControlState.normal)
        horario?.text = clinica?.horario
        endereco?.text = clinica?.endereco
    }
    @IBAction func ligar(_ sender: Any) {
        let urlCode = "tel://" + (telefone?.titleLabel?.text)!
        let url:NSURL = NSURL(string: urlCode)!
        UIApplication.shared.openURL(url as URL)
    }
}
