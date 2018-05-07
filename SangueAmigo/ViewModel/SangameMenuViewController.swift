//
//  SangameMenu.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 06/05/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit
class SangameMenuViewController : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let acertos = Prefs.getArray("acertos")
        if(acertos.count > 0){
            AlertaUtil.alerta("Parabéns! Todas as perguntas foram resolvidas.", viewController: self, action: nil)
        }
        Prefs.setArray(Array<Int>(), chave: "acertos")
    }
    
    @IBAction func jogar(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "QuizPerguntaViewController") as! QuizPerguntaViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
}
