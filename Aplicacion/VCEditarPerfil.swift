//
//  VCEditarPerfil.swift
//  Aplicacion
//
//  Created by Gloria on 8/6/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit

class VCEditarPerfil: UIViewController, DataHolderDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var txtNombre:UITextField?
    @IBOutlet var txtApellido:UITextField?
    @IBOutlet var btnCambiarFoto:UIButton?
    @IBOutlet var img: UIImageView?
    @IBOutlet var btnoK:UIButton!
    @IBOutlet var btnSubir:UIButton!
    var imagenDescargada:UIImage?


    let imagePicker = UIImagePickerController()
    var imgData:Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        txtNombre?.text = DataHolder.sharedInstance.miPerfil.nombre
        txtApellido?.text = DataHolder.sharedInstance.miPerfil.sApellidos
        
        img?.layer.cornerRadius = (img?.frame.size.width)!/2
        img?.layer.borderWidth = 2
        img?.layer.borderColor = UIColor.blue.cgColor
        
        btnSubir?.layer.cornerRadius = (btnSubir?.frame.size.width)!/18
        btnSubir?.layer.borderWidth = 2
        btnSubir?.layer.borderColor = UIColor.blue.cgColor
        
        self.img?.layer.cornerRadius = (self.img?.frame.size.width)!/2
        img?.clipsToBounds = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func accionBotonGaleria(){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func  quitarview(){
        tabBarController?.tabBar.isHidden = false
        self.removeFromParentViewController()
        self.view.removeFromSuperview()
        
        DataHolder.sharedInstance.miPerfil.nombre = txtNombre?.text
        DataHolder.sharedInstance.miPerfil.sApellidos = txtApellido?.text
       // DataHolder.sharedInstance.miPerfil.ifotoP = img?.image
       // mostrarimagen2(uri: DataHolder.sharedInstance.miPerfil.surl_image!)
        
    }
    
    @IBAction func accionBotonCamara(){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func accionBotonSubir(){
        let date : Date = Date()
        let tiempo : Int64 = Int64((date.timeIntervalSince1970*1000).rounded())
        let ruta : String = String(format: "fotoP/imagen%d.jpg", tiempo)
        let imagenRef = DataHolder.sharedInstance.firStorageRef?.child(ruta)
        let uploadTask = imagenRef?.putData(imgData!,metadata:nil){ (metadata,error) in
            guard let metadata = metadata else{
                print("*********", imagenRef)
                return
            }
            let  downloadURL = metadata.downloadURL
            print("*********", imagenRef)
            print("MI URL: ",downloadURL)
        }
    }
    
    
    func mostrarimagen2(uri:String) {
        let IMGDES = DataHolder.sharedInstance.HMIMG[uri]
        if(IMGDES != nil) {
            img?.image = IMGDES
        }
        else{
            let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
            gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if error != nil {
                } else {
                    self.imagenDescargada = UIImage(data: data!)
                    self.img?.image = self.imagenDescargada
                    DataHolder.sharedInstance.HMIMG[uri] = self.imagenDescargada
                }
            }
            
        }
    }
   
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let img2 = info[UIImagePickerControllerOriginalImage] as? UIImage
        img?.image = img2
        self.dismiss(animated: true, completion: nil)
        imgData = UIImageJPEGRepresentation(img2!, 0.5)
       
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
 
    
}
