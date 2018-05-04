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
    @IBOutlet weak var ajudaPular1: UIBarButtonItem!
    @IBOutlet weak var ajudaPular2: UIBarButtonItem!
    @IBOutlet weak var ajudaPular3: UIBarButtonItem!
    @IBOutlet weak var ajudaDica1: UIBarButtonItem!
    @IBOutlet weak var ajudaDica2: UIBarButtonItem!
    @IBOutlet weak var ajudaResposta: UIBarButtonItem!
    
    required init?(coder aDecoder: NSCoder) {
        perguntaService = PerguntaService()
        self.pergunta = Pergunta()
        super.init(coder: aDecoder)
        
    }
    override func viewDidLoad() {
      pergunta = perguntaService.getPergunta(1)
        let questaoTmp = "Questão \(pergunta.id ?? 0):"
        questaoNumero.text = questaoTmp
        questao.text = pergunta.questao
        alternativaA.setTitle("A) " + pergunta.alternativaA!, for: UIControlState.normal)
        alternativaB.setTitle("B) " + pergunta.alternativaB!, for: UIControlState.normal)
        alternativaC.setTitle("C) " + pergunta.alternativaC!, for: UIControlState.normal)
        alternativaD.setTitle("D) " + pergunta.alternativaD!, for: UIControlState.normal)
        alternativaE.setTitle("E) " + pergunta.alternativaE!, for: UIControlState.normal)
        //Remover após cadastrar as perguntas
       // salvarPerguntas()
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
