//
//  Dia.swift
//  Aplicacion
//
//  Created by Gloria on 11/6/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit

class Dia: NSObject {
    let IDfecha="fecha"
    let IDTexto="Texto"
    
    
    var sfecha:Date?
    var stexto:String?
    var sid: String?
    
    func setMap(valores: [String:Any]) {
        sfecha = valores[IDfecha] as? Date
        stexto = valores[IDTexto] as? String
    }
    
    func getMap() -> [String:Any] {
        return [
            IDfecha: sfecha as Any,
            IDTexto: stexto as Any
            
        ]
    }

}
