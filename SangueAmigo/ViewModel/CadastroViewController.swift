//
//  CadastroViewController.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 19/04/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit

class CadastroViewController : UIViewController{
    
    var dict : [String : AnyObject]!
    var usuarioService : UsuarioService!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.usuarioService = UsuarioService()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creating button
        let loginButton = LoginButton(readPermissions: [ .publicProfile, .email])
        loginButton.center = view.center
        
        //adding it to view
        view.addSubview(loginButton)
        
        
        //if the user is already logged in
        if (FBSDKAccessToken.current()) != nil{
            getFBUserData()
        }
        
    }
    
    @objc func loginButtonClicked(sender : UIButton) {
        let loginManager = LoginManager()
        
        loginManager.logIn(readPermissions: [.publicProfile], viewController : self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in")
            }
        }
    }
    
    func getFBUserData(){
        if(FBSDKAccessToken.current() != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id,name , email"]).start(completionHandler: { (connection, result, error) in
                guard let Info = result as? [String: Any] else { return }
                if(error == nil){
                    print(Info)
                    let usuario = Usuario()
                    usuario.nome = Info["name"] as! String
                    usuario.email = Info["email"] as! String
                    self.usuarioService.criarUsuario(usuario)
                    AlertaUtil.alerta("Bem vindo " + usuario.nome, viewController: self, action: {(UIAlertAction) -> Void in self.goBack()
                    })
                }
            })
    }
    }
    func goBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func clickOnBackBtn(_ sender: Any){
        self.goBack()
    }
}
