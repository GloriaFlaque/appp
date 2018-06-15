//
//  MiCelda.swift
//  Aplicacion
//
//  Created by Gloria on 12/6/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit

class MiCelda: UITableViewCell {
    @IBOutlet var lblDia:UILabel?
    @IBOutlet var lblTexto:UILabel?
    var imagenDescargada:UIImage?
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
