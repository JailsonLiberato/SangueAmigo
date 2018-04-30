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
        fotoPrincipal?.image = UIImage(named: (clinica?.foto!)!)
        telefone?.setTitle(clinica?.telefone, for: UIControlState.normal)
        horario?.text = clinica?.horario
        endereco?.text = clinica?.endereco
    }
    
    @IBAction func ligar(){
       // let numbersOnly = telefone?.titleLabel?.text?.replacingOccurrences(of: " ", with: "")
       // guard let number = URL(string: "tel://" + numbersOnly!) else { return }
        //UIApplication.shared.open(number)
        let url = URL(string: "TEL://123456789")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
}
