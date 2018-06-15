//
//  Perfil.swift
//  Aplicacion
//
//  Created by Gloria on 1/6/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit

class Perfil: NSObject {
    let IDnombre="nombre"
    let IDapellido="apellido"
    let IDFoto="fotoP"
    let IDImagen="url_image"
    
    var nombre:String?
    var sApellidos:String?
    var ifotoP: UIImage?
    var sid: String?
    var surl_image: String?
    var arDia:[Dia] = []
    
    
    func setMap(valores: [String:Any]) {
        nombre = valores[IDnombre] as? String
        sApellidos = valores[IDapellido] as? String
        ifotoP = valores[IDFoto] as? UIImage
        let rutaDia:String = String(format: "Perfiles/%@/Dias", sid!)
        
        DataHolder.sharedInstance.firestoreDB?.collection(rutaDia).whereField("fecha", isGreaterThan: Date()).getDocuments() { (querySnapshot, err) in
            if !(querySnapshot?.isEmpty)!{
                print("HHHHHHHHHHHH      ",querySnapshot?.count," ")
                for document in querySnapshot!.documents {
                    var dia: Dia = Dia()
                    dia.sid=document.documentID
                    dia.setMap(valores: document.data())
                    self.arDia.append(dia)
                    print(" WOWOWOWOWOWOWOWOW  ",document.data())
                }
            }
        }
         
    }
    
    func getMap() -> [String:Any] {
        return [
            IDnombre: nombre as Any,
            
            IDapellido: sApellidos as Any,
            
            IDFoto: ifotoP as Any,
            
            IDImagen: surl_image as Any
        ]
    }
    
    func agregarDia(dia: Dia) {
        arDia.append(dia)
    }

}
