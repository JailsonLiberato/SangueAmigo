//
//  Prefs.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 03/05/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import Foundation

class Prefs {
    
    let prefs = UserDefaults.standard
    
    class func setString(_ valor: String, chave: String) {
        let prefs = UserDefaults.standard
        prefs.setValue(valor, forKey: chave)
        prefs.synchronize()
    }
    
    class func getString(_ chave: String) -> String? {
        let prefs = UserDefaults.standard
        let s = prefs.string(forKey: chave)
        return s
    }
    
    class func setInt(_ valor: Int, chave: String) {
        let prefs = UserDefaults.standard
        prefs.set(valor, forKey: chave)
        prefs.synchronize()
    }
    
    class func getInt(_ chave: String) -> Int {
        let prefs = UserDefaults.standard
        let s = prefs.integer(forKey: chave)
        return s
    }
    
    class func setArray(_ valor: Array<Int>, chave: String) {
        let prefs = UserDefaults.standard
        prefs.set(valor, forKey: chave)
        prefs.synchronize()
    }
    
    class func getArray(_ chave: String) -> Array<Int> {
        let prefs = UserDefaults.standard
        let s = prefs.array(forKey: chave)
        return s as! Array<Int>
    }
}
