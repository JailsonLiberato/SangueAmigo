//
//  DoacaoViewController.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 19/04/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit

class DoacaoViewController : UIViewController{
    
    @IBOutlet var doacaoViewController: UIViewController!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem(title: "< Back", style: UIBarButtonItemStyle.plain, target: self, action: "goBack")
        navigationItem.leftBarButtonItem = backButton
    }
    
}
