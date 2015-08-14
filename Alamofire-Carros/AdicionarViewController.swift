//
//  AdicionarViewController.swift
//  Alamofire-Carros
//
//  Created by Quaddro Admin on 10/06/15.
//  Copyright (c) 2015 Quaddro Admin. All rights reserved.
//

import UIKit

class AdicionarViewController: UIViewController {

    
    @IBOutlet weak var textFieldMarca: UITextField!
    @IBOutlet weak var textFieldModelo: UITextField!
    @IBOutlet weak var textFieldAno: UITextField!
    @IBOutlet weak var textFieldPreco: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    
    @IBAction func adicionar(sender: UIButton) {
        
        var novoCarro = Carro()
        
        novoCarro.marca = textFieldMarca.text
        novoCarro.modelo = textFieldModelo.text
        novoCarro.ano = textFieldAno.text
        novoCarro.preco = textFieldPreco.text
        
        novoCarro.adicionarCarros { (sucesso) -> Void in
            
            //Se não ocorreu erro apesar alerta
            if sucesso == true{
            
                var alerta: UIAlertView = UIAlertView(title: "Atenção", message: "Seu cadastro foi incluso com sucesso", delegate: nil, cancelButtonTitle: "OK")
                
                alerta.show()
                
                self.navigationController?.popToRootViewControllerAnimated(true)
                
            }else{
            
                var alerta: UIAlertView = UIAlertView(title: "Vixe Nossa", message: "Deu erro mano!", delegate: nil, cancelButtonTitle: "OK")
                alerta.show()
            
            
            }
            
        }
        
        
        
        
    }
    

}
