//
//  DuvidasViewController.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 19/04/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit

class DuvidasViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet var duvidasViewController: UICollectionView!
    
    let menuItems : Array<Menu> = MenuService.getInfoMenuItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        duvidasViewController.dataSource = self;
        duvidasViewController.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "duvidaViewCell", for: indexPath) as! DuvidaViewCell
        
        let menu : Menu = menuItems[indexPath.row]
        
        let myImage = UIImage(named: menu.icone)
        
        cell.displayContent(image: myImage!, title: menu.label)
        
        return cell
        
    }
    
    @objc func tap(sender: UITapGestureRecognizer){
        
        if let indexPath = self.duvidasViewController?.indexPathForItem(at: sender.location(in: self.duvidasViewController)) {
            let cell : DuvidaViewCell = self.duvidasViewController?.cellForItem(at: indexPath) as! DuvidaViewCell
            let tipo = cell.label.text
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "duvidaExibirViewController") as! DuvidaExibirViewController
            newViewController.tipo = tipo
            self.navigationController!.pushViewController(newViewController, animated: true)

        }
    


}
    
    @IBAction func clickOnBackBtn(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }
}
