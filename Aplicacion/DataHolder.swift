//
//  DataHolder.swift
//  Aplicacion
//
//  Created by Gloria on 1/6/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseDatabase
import FirebaseStorage

class DataHolder: NSObject {
    static let sharedInstance:DataHolder = DataHolder()
    var firestoreDB:Firestore?
    
    var firDataBaseRef: DatabaseReference!
    var firStorageRef: StorageReference?
    var firStorage:Storage?
    var miPerfil:Perfil = Perfil()
    var arPerfiles:[Perfil] = []
    var arBusqueda:[Perfil]=[]
    var HMIMG:[String:UIImage]=[:]

    
    func initFireBAse(){
        FirebaseApp.configure()
        firestoreDB = Firestore.firestore()
        
        firDataBaseRef = Database.database().reference().child("Swift")
        firStorageRef = firStorage?.reference()
    
        
    }
    
    func Registrarse(delegate:DataHolderDelegate, sEmail:String, sPassword:String, sRepetirPassword:String) {
        var blfin:Bool = true
        print(sEmail, "    fdgdfg    ", sPassword, "    dfgdf   ")
        Auth.auth().createUser(withEmail: (sEmail), password:
        (sPassword)){ (user, error) in
            if user != nil{
                print("TE REGISTRASTES ")
                //self.perform(shouldPerformSegue(withIdentifier: "", sender: self))
                print(self.miPerfil.getMap())
                self.firestoreDB?.collection("Perfiles").document((user?.uid)!).setData(self.miPerfil.getMap());
                delegate.DHDDRegistro!(blFin: true)
            }
            else {
                print(error!)
                delegate.DHDDRegistro!(blFin: false)
            }
        }
    }
    
    func Login(delegate:DataHolderDelegate, sEmail:String, sPassword:String) {
        var blfin:Bool = true
        print(sEmail, "    fdgdfg    ", sPassword, "    dfgdf   ")
        Auth.auth().signIn(withEmail: (sEmail), password: (sPassword)) {
            (user, error) in
            if user != nil{
                print("ME HE LOGEADO!!!!! ",user?.uid)
                let ruta =
                    self.firestoreDB?.collection("Perfiles").document((user?.uid)!)
                ruta?.getDocument { (document, error) in
                    if document != nil{
                        self.miPerfil.sid = document?.documentID
                        self.miPerfil.setMap(valores: (document?.data()!)!)
                        print(document?.data())
                        delegate.DHDDLogin!(blFin: true)
                        
                        let str:String = String(format: "followers.%@", (user?.uid)!)
                        self.firestoreDB?.collection("Perfiles").whereField(str, isEqualTo: true).getDocuments() { (querySnapshot, err) in
                            if querySnapshot != nil{
                                //print("!!!!!!!!!!!!!!!!!      ",querySnapshot?.count," ")
                                for document in querySnapshot!.documents {
                                    
                                }
                            }
                        }
                    }
                }
            }
            else{
                print("No se ha logueado")
                print(error!)
                delegate.DHDDLogin!(blFin: false)
            }
        }
    }
    
    func BuscarPerfiles(delegate:DataHolderDelegate, palabra: String) {
        //let str:String = String(format: "followers.%@", (user?.uid)!)
        print("VOY A BUSCAR")
        self.firestoreDB?.collection("Perfiles").whereField("nombre", isEqualTo: palabra).getDocuments() { (querySnapshot, err) in
            if querySnapshot != nil{
                print("HHHHHHHHHHHH      ",querySnapshot?.count," ")
                for document in querySnapshot!.documents {
                    var perfil: Perfil = Perfil()
                    perfil.sid=document.documentID
                    perfil.setMap(valores: document.data())
                    self.arBusqueda.append(perfil)
                    print(" WOWOWOWOWOWOWOWOW  ",document.data())
                    
                }
                delegate.DHDDResBusqueda!(blFin: true)
            }
            // ...
            else{
                delegate.DHDDResBusqueda!(blFin: false)
            }
        }
    }
    
    func DescargarPerfiles(delegate:DataHolderDelegate) {
        
        self.firestoreDB?.collection("Perfiles").getDocuments() { (querySnapshot, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
            }
            else{
                DataHolder.sharedInstance.arPerfiles=[]
                
                for document in querySnapshot!.documents {
                    
                    let perfil:Perfil = Perfil()
                    perfil.sid=document.documentID
                    perfil.setMap(valores: document.data())
                    DataHolder.sharedInstance.arPerfiles.append(perfil)
                }
                print("--------- >>>",DataHolder.sharedInstance.arPerfiles.count)
                delegate.DHDDescargaPerfilesCompleta!(blFin: true)
                
            }
        }
        
    }
    

}
@objc protocol DataHolderDelegate{
    @objc optional func DHDDescargaPerfilesCompleta(blFin:Bool)
    @objc optional func DHDDRegistro(blFin:Bool)
    @objc optional func DHDDLogin(blFin:Bool)
    @objc optional func DHDDResBusqueda(blFin:Bool)
    
    
    
}
