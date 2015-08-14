//
//  AtualizarDeletarViewController.swift
//  Alamofire-Carros
//
//  Created by Quaddro Admin on 11/06/15.
//  Copyright (c) 2015 Quaddro Admin. All rights reserved.
//

import UIKit

class AtualizarDeletarViewController: UIViewController {

    
    @IBOutlet weak var textFieldMarca: UITextField!
    @IBOutlet weak var textFieldModelo: UITextField!
    @IBOutlet weak var textFieldAno: UITextField!
    @IBOutlet weak var textFieldPreco: UITextField!
    
    
    var carroAtual: Carro = Carro()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


       
        println("WOLOLO: \(carroAtual)")
        
        textFieldMarca.text = carroAtual.marca
        textFieldModelo.text = carroAtual.modelo
        textFieldPreco.text = carroAtual.preco
        textFieldAno.text = carroAtual.ano
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func atualizar(sender: UIButton) {
        
        
        carroAtual.modelo = textFieldModelo.text
        carroAtual.marca = textFieldMarca.text
        carroAtual.ano = textFieldAno.text
        carroAtual.preco = textFieldPreco.text
        
        
        carroAtual.atualizar { (sucesso) -> Void in
            
            if sucesso == true{
            
                var alerta = UIAlertView(title: "Alerta", message: "Atualizou mano", delegate: nil, cancelButtonTitle: "OK")
                alerta.show()
                
                self.navigationController?.popToRootViewControllerAnimated(true)
            }else{
            
                var alerta = UIAlertView(title: "Alerta", message: "Ferrou mano", delegate: nil, cancelButtonTitle: "OK")
                alerta.show()
            
            
            }
            
        }
        
        
        
    }
    
    
    @IBAction func deletar(sender: UIButton) {
        
        carroAtual.deletar { (sucesso) -> Void in
           
            if sucesso == true{
                var alerta: UIAlertView = UIAlertView(title: "Alerta", message: "FOII EMBORA", delegate: nil, cancelButtonTitle: "OK")
                alerta.show()
                
                self.navigationController?.popToRootViewControllerAnimated(true)
            }else{
                
                var alerta: UIAlertView = UIAlertView(title: "Alerta", message: "NUM FOII", delegate: nil, cancelButtonTitle: "OK")
                alerta.show()
            }
            
            
        }
        
        
        
    }

}
