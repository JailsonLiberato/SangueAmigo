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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        clinicaService =  ClinicaService()
    }
    
     var pickerDataSource = EstadoUtil.getEstadosCidades()
    var cidadeIndex : Int = 0
    var estadoIndex : Int = 0
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == estadoPicker){
        return pickerDataSource.count;
        }else{
            return pickerDataSource[estadoIndex].cidades.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == estadoPicker){
            
            return pickerDataSource[row].nome as String
        }else{
            
            return pickerDataSource[estadoIndex].cidades[row] as String
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == estadoPicker){
            self.cidadePicker.dataSource = self
            self.cidadePicker.delegate = self
            self.estadoIndex = row
        }else{
            self.cidadeIndex = row
        }
        
    }
    
    @IBAction func pesquisar(){
        let estado = pickerDataSource[estadoIndex].nome as String
        if(estado == "SELECIONE"){
            cidadeIndex = 0
        }
        let cidade = pickerDataSource[estadoIndex].cidades[cidadeIndex] as String
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
                    self.present(newViewController, animated: true, completion: nil)
                }
               
            }
        
            
            
        
    }
        clinicaService.list(estado, cidade: cidade , callback)
    }
    
            
        override func viewDidLoad() {
        super.viewDidLoad()
        self.estadoPicker.dataSource = self
        self.estadoPicker.delegate = self
    }
    
}
