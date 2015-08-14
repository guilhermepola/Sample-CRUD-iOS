//
//  CarrosTableViewController.swift
//  Alamofire-Carros
//
//  Created by Quaddro Admin on 10/06/15.
//  Copyright (c) 2015 Quaddro Admin. All rights reserved.
//

import UIKit

class CarrosTableViewController: UITableViewController {

    var arrayCarros = [Carro]()
    let atualizador = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Criando o RefreshControl (Arrastar a tabela para baixo e atualizar)
       
        atualizador.addTarget(self, action: "atualizarMalandro", forControlEvents: UIControlEvents.ValueChanged)
        
        tableView.addSubview(atualizador)
 
        atualizarMalandro()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
    
        atualizarMalandro()
        
    }
    
    func atualizarMalandro(){
        
        
        BProgressHUD.showLoadingView()

        var carros: Carro = Carro()

        carros.baixarCarros { (arrayCarros) -> Void in
            
            println(arrayCarros)
            
            self.arrayCarros = reverse(arrayCarros)
     
            self.tableView.reloadData()
            self.atualizador.endRefreshing()
            
            
          BProgressHUD.dismissHUD(2.0)
        }
    
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return arrayCarros.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("celula", forIndexPath: indexPath) as! UITableViewCell

        var carroAtual: Carro = arrayCarros[indexPath.row]
        
        cell.textLabel?.text = carroAtual.marca
        cell.detailTextLabel?.text = carroAtual.modelo
        
        
        return cell
    }
 
    @IBAction func atualizar(sender: UIBarButtonItem) {
    atualizarMalandro()
        
        
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        //verificando se o segue que vai acontecer é o segueAtualizar
        if segue.identifier == "segueAtualizar"{
    
            //Criando um instância da nossa tela "AtualizarDeletar"
            var telaAtualizarDeletar: AtualizarDeletarViewController = segue.destinationViewController as! AtualizarDeletarViewController
            
            //Passando a informação da nossa Tabela para nossa TelaAtualizarDeletar
            telaAtualizarDeletar.carroAtual = arrayCarros[tableView.indexPathForSelectedRow()!.row]
        
        }
        
        
        
    }
    
    
    //Falando que nossa tableView pode sofrer Edições
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
        
    }
    
    //Método para programar a alteração
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        var carroAtual = arrayCarros[indexPath.row]
        
        carroAtual.deletar { (sucesso) -> Void in
            
            if sucesso == true{
            
                let alerta: UIAlertView = UIAlertView(title: "Alerta", message: "Carro Deletado com sucesso", delegate: nil, cancelButtonTitle: "OK")
                
                alerta.show()
                
                self.arrayCarros.removeAtIndex(indexPath.row)
    
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
                
                self.atualizarMalandro()
            }
            
        }

    }
    
    
    
}
