//
//  DuvidaExibirViewController.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 13/05/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit

class DuvidaExibirViewController: UIViewController {
    
    var informacaoService : InformacaoService!
    var informacoes : Array<Informacao>?
    var tipo : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let callback = { (_ clinicas:Array<Informacao>?, error:Error?) -> Void in
            if error != nil {
                print("Erro")
                
            } else if let informacoes = self.informacoes {
                self.informacoes = informacoes
            }
        }
                
        
        informacaoService.list(tipo!, callback)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        informacaoService =  InformacaoService()
    }

}
