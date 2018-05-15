//
//  DuvidaViewCell.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 14/05/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit
class DuvidaViewCell: UICollectionViewCell{
    @IBOutlet var icone : UIImageView!
    @IBOutlet var label : UILabel!
    
    func displayContent(image:UIImage, title:String){
        icone.image = image
        label.text = title
    }
    
}
