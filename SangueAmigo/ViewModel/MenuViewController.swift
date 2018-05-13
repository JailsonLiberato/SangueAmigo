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
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        menuViewController.dataSource = self;
        menuViewController.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))

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
    
    @objc func tap(sender: UITapGestureRecognizer){
        
        if let indexPath = self.menuViewController?.indexPathForItem(at: sender.location(in: self.menuViewController)) {
            let cell : MenuViewCell = self.menuViewController?.cellForItem(at: indexPath) as! MenuViewCell
            let destino = cell.label.text
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            switch destino{
            case "Cadastro":
                print("Cadastro")
                
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "cadastroViewController") as! CadastroViewController
                self.present(newViewController, animated: true, completion: nil)
                break
            case "Onde Doar?":
                print("Onde Doar?")
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "doacaoViewController") as! DoacaoViewController
                self.navigationController!.pushViewController(newViewController, animated: true)
                break
            case "Quiz":
                print("Quiz")
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "SangameMenuViewController") as! SangameMenuViewController
                self.navigationController!.pushViewController(newViewController, animated: true)
                break
                
            case "Dúvidas":
                print("Duvidas")
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "duvidasViewController") as! DuvidasViewController
                self.navigationController!.pushViewController(newViewController, animated: true)
                break
            
            case "Sobre":
                print("Sobre")
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "sobreViewController") as! SobreViewController
                self.navigationController!.pushViewController(newViewController, animated: true)
                break
            
            case .none: break
                
            case .some(_): break
                
            }
    }


}
}

