//
//  ViewController.swift
//  Aplicacion
//
//  Created by Gloria on 29/5/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataHolderDelegate {
    @IBOutlet var btnLogin:UIButton?
    @IBOutlet var btnRegistrarse:UIButton?
    @IBOutlet var img: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        btnLogin?.layer.cornerRadius = (btnLogin?.frame.size.width)!/22
        btnLogin?.layer.borderColor = UIColor.blue.cgColor
        
        btnRegistrarse?.layer.cornerRadius = (btnLogin?.frame.size.width)!/22
        btnRegistrarse?.layer.borderColor = UIColor.blue.cgColor
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

