//
//  VCItem.swift
//  Aplicacion
//
//  Created by Gloria on 11/6/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class VCItem: UIViewController, UITableViewDelegate, UITableViewDataSource, DataHolderDelegate {
    
    @IBOutlet var Tabla:UITableView?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("COUNT: ",DataHolder.sharedInstance.miPerfil.arDia.count)
        return DataHolder.sharedInstance.miPerfil.arDia.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("INICIO TABLA")
        let cell:MiCelda =
            tableView.dequeueReusableCell(withIdentifier: "MiCelda1", for: indexPath) as! MiCelda
        cell.lblDia?.text =
            DataHolder.sharedInstance.miPerfil.arDia[indexPath.row].sfecha?.description
        cell.lblTexto?.text = 
            DataHolder.sharedInstance.miPerfil.arDia[indexPath.row].stexto
        return cell
    }
    
    func refreshUI() {
        DispatchQueue.main.async {
            self.Tabla?.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.DescargarPerfiles(delegate: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func DHDDescargaPerfilesCompleta(blFin: Bool) {
        if blFin{
            self.refreshUI()
        }
    }

}
