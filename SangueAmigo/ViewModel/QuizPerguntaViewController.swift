//
//  QuizPerguntaViewController.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 03/05/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit
class QuizPerguntaViewController : UIViewController{
    
    var pergunta : Pergunta
    var codigo : Int?
    var perguntaService: PerguntaService
    @IBOutlet weak var questaoNumero: UILabel!
    @IBOutlet weak var questao: UILabel!
    @IBOutlet weak var alternativaA: UIButton!
    @IBOutlet weak var alternativaB: UIButton!
    @IBOutlet weak var alternativaC: UIButton!
    @IBOutlet weak var alternativaD: UIButton!
    @IBOutlet weak var alternativaE: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        perguntaService = PerguntaService()
        self.pergunta = Pergunta()
        super.init(coder: aDecoder)
        
    }
    override func viewDidLoad() {
       proximaPergunta()
        //Remover após cadastrar as perguntas
       // salvarPerguntas()
    }
    
    
    @IBAction func responder(_ sender: Any) {
        if let sender = sender as? UIButton {
            let myString = sender.title(for: .normal)
            let qtdPerguntas = perguntaService.count()
            let resultado = myString?.contains(pergunta.resposta! + ")")
            var acertos = Prefs.getArray("acertos")
            if(resultado)!{
                
                let numero = self.questaoNumero.text?.replacingOccurrences(of: "Questão ", with: "").replacingOccurrences(of: ":", with: "")
                
                let numeroInt = Int(numero!)
                acertos.append(numeroInt!)
                Prefs.setArray(acertos, chave: "acertos")
                
                if(acertos.count == qtdPerguntas){
                    AlertaUtil.alerta("Parabéns você acertou! Sabe tudo sobre sangue.", viewController: self, action: {(UIAlertAction) -> Void in
                        self.goBack()
                    })
                    
                }else{
                    AlertaUtil.alerta("Parabéns você acertou!", viewController: self, action: {(UIAlertAction) -> Void in
                       self.reload()
                    })
                    
                }
               
            }else{
                    AlertaUtil.alerta("Que pena você errou! Você acertou \(acertos.count)", viewController: self, action: {(UIAlertAction) -> Void in self.goBack()
                    })
            }
        }
    }
    
    func reload(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "QuizPerguntaViewController") as! QuizPerguntaViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
    
    func proximaPergunta(){
        let acertos = Prefs.getArray("acertos")
        let qtdPerguntas = perguntaService.count()
        var flag:Bool = false
        var codigo = 0
        repeat
        {
            let randomNum:UInt32 = arc4random_uniform(UInt32(qtdPerguntas))
            codigo = Int(randomNum) + 1
            flag = false
            for i in acertos{
                if(i == codigo){
                    flag = true
                    break
                }
            }
            
        }while flag
            
          
            pergunta = perguntaService.getPergunta(codigo)
            let questaoTmp = "Questão \(pergunta.id ?? 0):"
            questaoNumero.text = questaoTmp
            questao.text = pergunta.questao
            alternativaA.setTitle("A) " + pergunta.alternativaA!, for: UIControlState.normal)
            alternativaB.setTitle("B) " + pergunta.alternativaB!, for: UIControlState.normal)
            alternativaC.setTitle("C) " + pergunta.alternativaC!, for: UIControlState.normal)
            alternativaD.setTitle("D) " + pergunta.alternativaD!, for: UIControlState.normal)
            alternativaE.setTitle("E) " + pergunta.alternativaE!, for: UIControlState.normal)
}
     
    func goBack(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "SangameMenuViewController") as! SangameMenuViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func encerrar(){
        let acertos = Prefs.getArray("acertos")
        let alert = UIAlertController(title: "Você acertou \(acertos.count). Deseja encerrar ?", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive, handler: {(alert:UIAlertAction!) in
            self.goBack()
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.destructive, handler: {(alert:UIAlertAction!) in}))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func salvarPerguntas(){
        pergunta.id = 0
    pergunta.questao = "Onde doar sangue?"
    pergunta.alternativaA = "Banco de Sangue"
    pergunta.alternativaB = "Restaurante"
    pergunta.alternativaC = "Escola"
    pergunta.alternativaD = "Mercado"
    pergunta.alternativaE = "Igreja"
    pergunta.resposta = "A"
        
    perguntaService.save(pergunta)
    print(perguntaService.getPerguntas().count)
    
    }
    
}
