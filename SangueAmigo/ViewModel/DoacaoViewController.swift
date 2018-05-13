//
//  DoacaoViewController.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 19/04/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit

class DoacaoViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
  
    @IBOutlet weak var estadoPicker: UIPickerView!
    @IBOutlet weak var cidadePicker: UIPickerView!
    var clinicaService:ClinicaService!
    var clinicas : Array<Clinica>?
    var pickerDataSource = EstadoUtil.getEstadosCidades()
    var cidadeIndex : Int?
    var estadoIndex : Int?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        clinicaService =  ClinicaService()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.estadoPicker.dataSource = self
        self.estadoPicker.delegate = self
        self.cidadePicker.dataSource = self
        self.cidadePicker.delegate = self
        estadoIndex = Prefs.getInt("EstadoIndex")
        cidadeIndex = Prefs.getInt("CidadeIndex")
        estadoPicker.selectRow(estadoIndex!, inComponent: 0, animated: true)
        cidadePicker.selectRow(cidadeIndex!, inComponent: 0, animated: true)
        self.navigationController!.navigationBar.backItem!.title = "Voltar"
        self.addBackbutton(title: "Voltar")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = ""
    }
    
    
   
    
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
 
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == estadoPicker){
        return pickerDataSource.count;
        }else{
            return pickerDataSource[estadoIndex!].cidades.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == estadoPicker){
            return pickerDataSource[row].nome as String
        }else{
            
            return pickerDataSource[estadoIndex!].cidades[row] as String
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == estadoPicker){
            self.cidadePicker.dataSource = self
            self.cidadePicker.delegate = self
            self.estadoIndex = row
            Prefs.setInt(self.estadoIndex!, chave: "EstadoIndex")
        }else{
            self.cidadeIndex = row
            Prefs.setInt(self.cidadeIndex!, chave: "CidadeIndex")
        }
        
    }
    
    @IBAction func pesquisar(){
        let estado = pickerDataSource[estadoIndex!].nome as String
        if(estado == "SELECIONE"){
            cidadeIndex = 0
        }
        let cidade = pickerDataSource[estadoIndex!].cidades[cidadeIndex!] as String
        let callback = { (_ clinicas:Array<Clinica>?, error:Error?) -> Void in
            if error != nil {
                
                print("Erro")
                
            } else if let clinicas = clinicas {
                
                self.clinicas = clinicas
                if(estado == "SELECIONE" || cidade == "SELECIONE"){
                     AlertaUtil.alerta("Preencher os filtros de Estado e Cidade.", viewController: self, action: nil)
                }
                if(self.clinicas?.count == 0){
                    AlertaUtil.alerta("Não possui clínicas cadastradas com a cidade e estado selecionados.", viewController: self, action: nil)
                }
                else{
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "DoacaoListViewController") as! DoacaoListViewController
                    newViewController.clinicas = clinicas
                    newViewController.estadoSelecionado = self.estadoIndex
                    newViewController.cidadeSelecionada = self.cidadeIndex
                    Prefs.setInt(self.estadoIndex!, chave: "EstadoIndex")
                    Prefs.setInt(self.cidadeIndex!, chave: "CidadeIndex")
                    self.navigationController!.pushViewController(newViewController, animated: true)
                }
               
            }
        
            
            
        
    }
        clinicaService.list(estado, cidade: cidade , callback)
    }
    
            
  
    
}

extension UIViewController {
    
    @objc func backButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addBackbutton(title: String) {
        
        if let nav = self.navigationController,
            let item = nav.navigationBar.topItem {
            item.backBarButtonItem  = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.plain, target: self, action:
                #selector(self.backButtonAction))
        } else {
            if let nav = self.navigationController,
                let _ = nav.navigationBar.backItem {
                self.navigationController!.navigationBar.backItem!.title = title
            }
        }
    }
}
