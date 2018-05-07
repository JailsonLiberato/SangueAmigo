//
//  ClinicaService.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 28/04/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import Foundation
import FirebaseDatabase
class ClinicaService{
    var ref: DatabaseReference!
    
    init() {
       ref = Database.database().reference()
    }
    
    func list(_ estado:String, cidade:String,_ callback: @escaping (_ clinicas:Array<Clinica>?, _ error:Error?) -> Void) {

        var clinicas : Array<Clinica> = []
        
           let _ = ref.child("clinicas").observeSingleEvent(of: .value ,with: { (snapshot) in
              
                let lista = snapshot.value as? [String: Any]
                for i in lista! {
                      let dict =  i.value as! NSDictionary
                    if(dict["cidade"] as! String == cidade && dict["estado"] as! String == estado){
                      
                        let clinica = Clinica()
                        clinica.id = dict["id"] as? String ?? ""
                        clinica.nome = dict["nome"] as? String ?? ""
                        clinica.foto = dict["foto"] as? String ?? ""
                        clinica.fotoPrincipal = dict["fotoPrincipal"] as? String ?? ""
                        clinica.horario = dict["horario"] as? String ?? ""
                        clinica.telefone = dict["telefone"] as? String ?? ""
                        clinica.cidade = dict["cidade"] as? String ?? ""
                        clinica.estado = dict["estado"] as? String ?? ""
                        clinica.endereco = dict["endereço"] as? String ?? ""
                        clinicas.append(clinica)
                      
                    }
                    
                  
                    
                    
                }
            DispatchQueue.main.async {
                callback(clinicas,nil)
            }
                
                
            }) { (error) in
                print(error.localizedDescription)
            }
    }
    
    public func synchronized<L: NSLocking>(lockable: L, criticalSection: () -> ()) {
        lockable.lock()
        criticalSection()
        lockable.unlock()
    }
    
    
}
