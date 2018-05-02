//
//  AlertaUtil.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 01/05/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit
class AlertaUtil{
    class func alerta(_ msg:String, viewController: UIViewController, action: ((UIAlertAction?) -> Void)!){
        let alert = UIAlertController(title: "Alerta", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: action))
        viewController.present(alert, animated: true, completion: nil)
    }
}
