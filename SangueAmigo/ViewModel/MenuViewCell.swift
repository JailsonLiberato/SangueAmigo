//
//  MenuViewCell.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 18/04/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit

class MenuViewCell : UICollectionViewCell{
    @IBOutlet var icone : UIImageView!
    @IBOutlet var label : UILabel!
    
    func displayContent(image:UIImage, title:String){
    icone.image = image
    label.text = title
}
}
