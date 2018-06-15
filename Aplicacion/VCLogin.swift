//
//  VCLogin.swift
//  Aplicacion
//
//  Created by Gloria on 1/6/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit

class VCLogin: UIViewController, DataHolderDelegate {
    @IBOutlet var txtUser:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var btnEntrar:UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func eventoClickLogin(){
        DataHolder.sharedInstance.Login(delegate: self, sEmail: (txtUser?.text)!, sPassword: (txtPass?.text)!)
        print("He terminado")
    }
    
    func DHDDLogin(blFin: Bool) {
        print("khvfjhvjhjhdc")
        if blFin{
            self.performSegue(withIdentifier: "ii", sender: self)
        }
    }



}
