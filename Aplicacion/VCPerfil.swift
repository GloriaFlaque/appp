//
//  VCPerfil.swift
//  Aplicacion
//
//  Created by Gloria on 8/6/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit

class VCPerfil: UIViewController, DataHolderDelegate {
    @IBOutlet var btnAnadir:UIButton?
    @IBOutlet var btnEditarPerfil:UIButton?
    @IBOutlet var txtTexto:UITextView?
    @IBOutlet var txtfecha:UIDatePicker?
    @IBOutlet var imgPerfil:UIImageView?
    @IBOutlet var lblNombre:UILabel?
    
    
    
    
    @IBAction func clickAñadir(){
        let nuevoDia:Dia = Dia()
        print("ffffffffff", txtfecha?.date)
        nuevoDia.sfecha = txtfecha?.date
        nuevoDia.stexto = txtTexto?.text
        DataHolder.sharedInstance.miPerfil.agregarDia(dia: nuevoDia)
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblNombre?.text = DataHolder.sharedInstance.miPerfil.nombre
        imgPerfil?.image = DataHolder.sharedInstance.miPerfil.ifotoP
        
        imgPerfil?.layer.cornerRadius = (imgPerfil?.frame.size.width)!/2
        imgPerfil?.layer.borderWidth = 2
        imgPerfil?.layer.borderColor = UIColor.blue.cgColor
        
        
        btnEditarPerfil?.layer.cornerRadius = (btnEditarPerfil?.frame.size.width)!/18
        btnEditarPerfil?.layer.borderWidth = 2
        btnEditarPerfil?.layer.borderColor = UIColor.blue.cgColor
        
        
        btnAnadir?.layer.cornerRadius = (btnAnadir?.frame.size.width)!/22
        btnAnadir?.layer.borderWidth = 2
        btnAnadir?.layer.borderColor = UIColor.blue.cgColor

        
        
        self.imgPerfil?.layer.cornerRadius = (self.imgPerfil?.frame.size.width)!/2
        imgPerfil?.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func show_alert_perfil(sender:UIButton){
        tabBarController?.tabBar.isHidden = true
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VCEditarPerfil") as! VCEditarPerfil
        
        self.addChildViewController(vc)
        self.view.addSubview(vc.view)
    }
    

}
