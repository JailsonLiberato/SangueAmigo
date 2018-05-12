//
//  SobreViewController.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 19/04/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit

class SobreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
