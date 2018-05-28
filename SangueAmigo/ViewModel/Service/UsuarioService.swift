//
//  UsuarioService.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 21/05/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import Foundation
import FirebaseDatabase
class UsuarioService{
    
    var ref: DatabaseReference!
    
    init() {
        ref = Database.database().reference()
    }
    
    
    func criarUsuario(_ usuario:Usuario){
        let callback = { (_ usuarios:Array<Usuario>?, error:Error?) -> Void in
            if error != nil {
                print("Erro")
            } else if let usuarios = usuarios {
                if(!self.isUsuarioExiste(usuario, usuarios)){
            self.ref.child("usuarios").childByAutoId().setValue(["nome": usuario.nome, "email": usuario.email])
        }
            }
    }
        findUsuarios(callback)
    }
    
    func findUsuarios(_ callback: @escaping (_ usuarios:Array<Usuario>?, _ error:Error?) -> Void) {
        var usuarios : Array<Usuario> = Array<Usuario>()
        let _ = ref.child("usuarios").observeSingleEvent(of: .value ,with: { (snapshot) in
            
            let lista = snapshot.value as? [String: Any]
            for i in lista! {
                let dict =  i.value as! NSDictionary
                let usuario = Usuario()
                usuario.nome = dict["nome"] as! String
                usuario.email = dict["email"] as! String
                usuarios.append(usuario)
            }
            DispatchQueue.main.async {
                callback(usuarios,nil)
            }
        }
        )
    }
    
    func isUsuarioExiste(_ usuario:Usuario, _ usuarios:Array<Usuario>) -> Bool {
        var isUsuarios : Bool = false
        for u in usuarios{
            if(u.email == usuario.email){
                isUsuarios = true
                break
            }
        }
        return isUsuarios
    }
}
