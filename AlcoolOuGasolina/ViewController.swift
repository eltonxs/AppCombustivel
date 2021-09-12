//
//  ViewController.swift
//  AlcoolOuGasolina
//
//  Created by Xavier de Souza, Elton on 11/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultadoLegenda: UILabel!
    @IBOutlet weak var precoAlcoolCampo: UITextField!
    @IBOutlet weak var precoGasolinaCampo: UITextField!
    
    @IBAction func calcularCombustivel(_ sender: Any) {
        
        if let precoAlcool = precoAlcoolCampo.text {
            if let precoGasolina = precoGasolinaCampo.text {
                
                //validar valores digitados
               let validaCampos =  self.validarCampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                
                if validaCampos{
                    //calcular melhor combustivel
                    self.calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                    
                } else {
                    resultadoLegenda.text = "Digite os precos para Calcular!"
                }
            }
        }
        
    }
    
    func calcularMelhorPreco(precoAlcool: String, precoGasolina: String){
        //Converte valores textos para numeros
        if let valorAlcool = Double(precoAlcool) {
            if let valorGasolina = Double(precoGasolina) {
                
                // faz calculo
                let resultadoPreco = valorAlcool / valorGasolina
                if resultadoPreco >= 0.7 {
                    self.resultadoLegenda.text = "Mehor utilizar Gasolina"
                }else {
                    self.resultadoLegenda.text = "Melhor Utilizar Alcool"
                }
                
            }
        }
        
    }
    
    
    func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool{
        
        var camposValidados = true
        if precoAlcool.isEmpty {
            camposValidados = false
        }else if precoGasolina.isEmpty{
            camposValidados = false
        }
        
        return camposValidados
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

