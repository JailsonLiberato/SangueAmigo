//
//  EstadoUtil.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 24/04/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import Foundation
class EstadoUtil{
    class func getEstadosCidades() -> Array<Estado>{
        let path = Bundle.main.path(forResource: "estados-cidades", ofType: "json")
        if(path == nil) {
            return []
        }
        
        //let data = try? Data(contentsOf: URL(fileURLWithPath: path!))
        
        var jsonString = JSONUtil.readJson()
        
        var estados =  Array<Estado>()
        var estadoSelecionar = Estado()
        estadoSelecionar.nome = "SELECIONE"
        estadoSelecionar.sigla = "--"
        var cidadeSelecionar = Array<String>()
        cidadeSelecionar.append("SELECIONE")
        estadoSelecionar.cidades = cidadeSelecionar
        estados.append(estadoSelecionar)
        for obj in jsonString{
            let array = obj.value as! NSArray
            for e in array{
                let estado = Estado()
                var dict = e as! NSDictionary
                estado.sigla = dict["sigla"] as! String
                estado.nome = dict["nome"] as! String
                estado.cidades = dict["cidades"] as! Array<String>
                estados.append(estado)
            }
            
        }
      

        return estados
    }

}
