//
//  PerguntaService.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 04/05/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import Foundation
class PerguntaService{
    var db : SangueAmigoDB
    
    init() {
       db = SangueAmigoDB()
    }
    
    func count() -> Int{
        return db.count()
    }
    
    func getPergunta(_ codigo: Int) -> Pergunta{
        return db.getPergunta(codigo)
    }
    
    func getPerguntas() -> Array<Pergunta>{
        return db.getPerguntas()
    }
    
    func save(_ pergunta : Pergunta){
        db.save(pergunta)
    }
    
}
