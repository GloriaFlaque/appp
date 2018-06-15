//
//  VCRegister.swift
//  Aplicacion
//
//  Created by Gloria on 1/6/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit

class VCRegister: UIViewController, DataHolderDelegate {
    @IBOutlet var txtNombre:UITextField?
    @IBOutlet var txtApellidos:UITextField?
    @IBOutlet var txtEmail:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var txtRepetirPassword:UITextField?
    @IBOutlet var btnRegistrarse:UIButton?
    @IBOutlet var btnCancelar:UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
    
    @IBAction func clickRegistrar(){
        DataHolder.sharedInstance.miPerfil.nombre = txtNombre?.text
        DataHolder.sharedInstance.miPerfil.sApellidos = txtApellidos?.text
       
        print(DataHolder.sharedInstance.miPerfil.getMap())
        
        DataHolder.sharedInstance.Registrarse(delegate: self, sEmail: (txtEmail?.text)!, sPassword: (txtPass?.text)!, sRepetirPassword: (txtRepetirPassword?.text)!)
    }

    
    func DHDDRegistro(blFin: Bool) {
        if blFin{
           
            self.performSegue(withIdentifier: "uu", sender: self)
        }
    }

    
    

}
