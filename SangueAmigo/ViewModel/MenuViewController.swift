//
//  ViewController.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 18/04/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet var menuViewController: UICollectionView!
    
    let menuItems : Array<Menu> = MenuService.getMenuItems()

    override func viewDidLoad() {
        super.viewDidLoad()
 menuViewController.dataSource = self;
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuViewCell", for: indexPath) as! MenuViewCell
        
        var menu : Menu = menuItems[indexPath.row]
      
        let myImage = UIImage(named: menu.icone)
        
        cell.displayContent(image: myImage!, title: menu.label)
        
        return cell
        
    }


}

