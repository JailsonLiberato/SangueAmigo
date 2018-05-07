//
//  MenuService.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 18/04/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit

class MenuService{
    
    static func getMenuItems() -> Array<Menu>{
        var array = Array<Menu>()
        var m1 = Menu()
        m1.label = "Cadastro"
        m1.icone = "user.png"
        array.append(m1)
        
        var m2 = Menu()
        m2.label = "Onde Doar?"
        m2.icone = "gps.png"
        array.append(m2)
        
        var m3 = Menu()
        m3.label = "Quiz"
        m3.icone = "quiz.png"
        array.append(m3)
        
        var m4 = Menu()
        m4.label = "Dúvidas"
        m4.icone = "help.png"
        array.append(m4)
        
        var m5 = Menu()
        m5.label = "Sobre"
        m5.icone = "logo.png"
        array.append(m5)
        return array
    }
}
