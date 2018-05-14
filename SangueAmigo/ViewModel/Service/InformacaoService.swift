//
//  InformacaoService.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 13/05/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import Foundation
import FirebaseDatabase
class InformacaoService{
    
    var ref: DatabaseReference!
    
    init() {
        ref = Database.database().reference()
    }
    
     func list(_ tipo:String,_ callback: @escaping (_ informacoes:Array<Informacao>?, _ error:Error?) -> Void) {
        var informacoes : Array<Informacao> = []
        let _ = ref.child("informacoes").observeSingleEvent(of: .value ,with: { (snapshot) in
            let lista = snapshot.value as? [String: Any]
            for i in lista! {
                let dict =  i.value as! NSDictionary
                let informacao = Informacao()
                informacao.id = dict["id"] as? Int ?? 0
                informacao.tipo = dict["tipo"] as? String ?? ""
                informacao.info = dict["info"] as? String ?? ""
                informacao.url = dict["url"] as? String ?? ""
                informacoes.append(informacao)
            }
            
            DispatchQueue.main.async {
                callback(informacoes,nil)
            }
            
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
