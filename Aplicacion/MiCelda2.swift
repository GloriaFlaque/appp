//
//  MiCelda2.swift
//  Aplicacion
//
//  Created by Gloria on 12/6/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit

class MiCelda2: UITableViewCell {
    @IBOutlet var lblNombre:UILabel?
    @IBOutlet var imgFoto:UIImageView?
    var imagenDescargada:UIImage?
   
    func mostrarimagen2(uri:String) {
        let IMGDES = DataHolder.sharedInstance.HMIMG[uri]
        if(IMGDES != nil) {
            imgFoto?.image = IMGDES
        }
        else{
            let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
            gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if error != nil {
                } else {
                    self.imagenDescargada = UIImage(data: data!)
                    self.imgFoto?.image = self.imagenDescargada
                    DataHolder.sharedInstance.HMIMG[uri] = self.imagenDescargada
                }
            }
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
