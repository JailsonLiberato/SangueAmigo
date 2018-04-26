//
//  JSONUtil.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 26/04/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import Foundation
class JSONUtil{
    class func readJson() -> [String: Any] {
        do {
            if let file = Bundle.main.url(forResource: "estados-cidades", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    print(object)
                    
                    return object
                } else if let object = json as? [Any] {
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        return [:]
    }
}
