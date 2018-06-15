//
//  VCBuscar.swift
//  Aplicacion
//
//  Created by Gloria on 8/6/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit

class VCBuscar: UIViewController, DataHolderDelegate, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet var MiTabla: UITableView?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataHolder.sharedInstance.arBusqueda.count;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  =
            tableView.dequeueReusableCell(withIdentifier: "Tabla", for: indexPath)
        
        print("----------------->>>>>>>>>>>>><",DataHolder.sharedInstance.arBusqueda[indexPath.row].nombre)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("SE HA CLICKEADO!!!!")
        DataHolder.sharedInstance.BuscarPerfiles(delegate: self, palabra: searchBar.text!)
    }
    
    func DHDDResBusqueda(blFin: Bool) {
        if(blFin==true){
            MiTabla?.reloadData()
        }
    }
    

}
