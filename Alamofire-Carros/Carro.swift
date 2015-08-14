//
//  Carro.swift
//  Alamofire-Carros
//
//  Created by Quaddro Admin on 10/06/15.
//  Copyright (c) 2015 Quaddro Admin. All rights reserved.
//

import UIKit
//Importando o framework
import Alamofire

class Carro: NSObject {
    
    //O que Carro possui?
    //http://quaddro.com.br:4444/carros/listar
    var carroID = String()
    var modelo = String()
    var marca = String()
    var ano = String()
    var preco = String()
    
    
    
    //Criando um função que faz o Download de todos os carros
    func baixarCarros(completion: ([Carro]) -> Void){
     
        /*
            GET - PEGAR OS DADOS
            POST - ENVIAR DADOS
            PUT  - ATUALIZAR DADOS
            DELETE - DELETAR DADOS
        */
        
        var arrayCarros = [Carro]()
        
        Alamofire.request(.GET, "http://104.236.33.72:8080/carros/listar", parameters: nil).responseJSON(options: NSJSONReadingOptions.AllowFragments) { (request, resposta, responseObject, erro) -> Void in
            
//            println(responseObject!)
            
            //O responseJSON traz a informação como NSArray ou NSDictionary
            for carroDic in (responseObject as! NSArray){
                
                var novoCarro = Carro()
                
                novoCarro.carroID = carroDic["_id"] as! String
                novoCarro.modelo = carroDic["modelo"] as! String
                novoCarro.marca = carroDic["marca"] as! String
                novoCarro.ano = carroDic["ano"] as! String
                novoCarro.preco = carroDic["preco"] as! String
            
                arrayCarros.append(novoCarro)
            
            }
            
            completion(arrayCarros)
//            println(arrayCarros)
            
        }
    }
    
    func adicionarCarros(sucesso: (Bool) -> Void){

        
        
        var dicionarioParametro = ["modelo": modelo, "marca": marca, "ano": ano, "preco": preco]
    
        Alamofire.request(.POST, "http://104.236.33.72:8080/carros/adicionar", parameters: dicionarioParametro).responseJSON(options: NSJSONReadingOptions.AllowFragments) { (request, response, responseObject, error) -> Void in
            
          
            //Verificando se houve erro e passando no "sucesso"
            if error == nil{
            
                sucesso(true)
            
            }else{
                
                sucesso(false)
            }

            
            
            
        }
        
    
    }
    
    
    func atualizar(sucesso: (Bool) -> Void){
    
    var dicionarioParametros = ["modelo": modelo, "marca": marca, "ano": ano, "preco": preco]
    
        
        var pathService = "http://104.236.33.72:8080/carros/alterar/\(carroID)"
        
        Alamofire.request(.PUT, pathService, parameters: dicionarioParametros).responseJSON(options: NSJSONReadingOptions.AllowFragments) { (request, response, responseObject, error) -> Void in
            
            
            
            if error == nil {sucesso(true)}
            else {sucesso(false)}
            
        }

    }
    
    func deletar(sucesso: (Bool) -> Void){
        
        var pathService = "http://104.236.33.72:8080/carros/remover/\(carroID)"
        
        Alamofire.request(.DELETE, pathService, parameters: nil).responseJSON(options: NSJSONReadingOptions.AllowFragments) { (request, response, responseObject, error) -> Void in
            
            error == nil ? sucesso(true) : sucesso(false)
            
        }
        
        
    }
    
    
    
}
