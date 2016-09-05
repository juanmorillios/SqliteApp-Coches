//
//  ViewController.swift
//  SqliteApp
//
//  Created by Juan Morillo on 4/9/16.
//  Copyright © 2016 JuanMorillios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var guardarModeloTextField: UITextField!
    
    @IBOutlet weak var precioTextField: UITextField!

    @IBOutlet weak var consultarModeloTextField: UITextField!
    @IBOutlet weak var cantidadTextField: UITextField!
    
    let objetoFileHelper = FileHelper()
    
    var baseDatos : FMDatabase? = nil
    
    var alert : UIAlertController? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        baseDatos = FMDatabase(path: objetoFileHelper.pathArchivoEnCarpetaDocumentos("Coches"))
    
        
    }

    @IBAction func guardarBtnPressed(sender: UIButton) {
        
        if guardarModeloTextField.hasText() && precioTextField.hasText() && cantidadTextField.hasText() {
        
            print("Si puede guardar datos")
            
            iniciarGuardadoDatos(guardarModeloTextField.text! , precio: Int(precioTextField.text!)!)

            
        
        }else {
        
            print("No puede guardar")
        
        
        }
        
        
    }

    @IBAction func buscarBtnPressed(sender: UIButton) {
        
        if consultarModeloTextField.hasText() {
        print("Puede buscar")
            
             iniciarBusquedaDatos(consultarModeloTextField.text!)
        
        
        }else {
        
            print("No puede buscar")
        
        
        }
        
        
    }
    
    func iniciarGuardadoDatos(modelo: String, precio: Int) {
        
        if (baseDatos!.open()) {
        
            let foregnKey = "PRAGMA foreng_keys = ON"
            baseDatos?.executeUpdate(foregnKey, withArgumentsInArray: nil)
            
            let insertQuerySQL = "INSERT INTO informacion (modelo, precio) VALUES('\(modelo)', \(precio)' )"
            
            let resultadoDelUpdate = baseDatos?.executeUpdate(insertQuerySQL, withArgumentsInArray: nil)
            
            if (resultadoDelUpdate != nil) {
            
                
                alert = UIAlertController(title: "Update Datos", message: "Dato guardado", preferredStyle: .Alert)
                alert?.addAction(UIAlertAction(title: "Continua", style: .Default, handler: nil))
                presentViewController(alert!, animated: true, completion: nil)
                    
           
            }else {
            
                
                alert = UIAlertController(title: "Error en insertar", message: "Dato no guardado", preferredStyle: .Alert)
                alert?.addAction(UIAlertAction(title: "Continua", style: .Default, handler: nil))
                presentViewController(alert!, animated: true, completion: nil)
            
            }
        
        }
        
        
    }

    
    func iniciarBusquedaDatos(modelo: String) {
        
        
        var precio : Int32?
        
        //Iniciar la base de datos
        
        if (baseDatos!.open()) {
            
            //Crear la Query SQL
            
            let queySQL = "SELECT precio FROM informacion WHERE modelo = '"+modelo+"'"
            
            //Creamos variable que contenga los resultados y ejecute la sentencia "query"
            let resultados:FMResultSet? = baseDatos?.executeQuery(queySQL, withArgumentsInArray: nil )
            
            
            while resultados!.next() == true {
                precio = resultados!.intForColumn("precio")
                
            }
            
            //Cerrar base de datos
            baseDatos?.close()
            
            print("")
            
            alert = UIAlertController(title: "Consulta precio", message: "El precio del carro es: \(precio)", preferredStyle: .Alert)
            alert?.addAction(UIAlertAction(title: "Continua", style: .Default, handler: nil))
            presentViewController(alert!, animated: true, completion: nil)

            
        }else {
            
            if  consultarModeloTextField.hasText() {
            
            alert = UIAlertController(title: "Consulta precio", message: "Quillo escribe algo", preferredStyle: .Alert)
            alert?.addAction(UIAlertAction(title: "Continua", style: .Default, handler: nil))
            presentViewController(alert!, animated: true, completion: nil)
                
            }
            
            
        }
        
        
    }
    
    func alerta() {
    
      }

    
}

