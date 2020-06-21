//
//  DetalleJuegoViewController.swift
//  UAP_3_Martin_Villa
//
//  Created by mvilla on 6/20/20.
//  Copyright © 2020 Martin Villa . All rights reserved.
//

import UIKit

class DetalleJuegoViewController: UIViewController {

   @IBOutlet weak var imgJuego          : UIImageView!
    @IBOutlet weak var lblNombre        : UILabel!
    @IBOutlet weak var lblDescripcion   : UILabel!
    @IBOutlet weak var lblTipo          : UILabel!
    @IBOutlet weak var lblLanzamiento   : UILabel!
    
    var objJuego: Juego!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblLanzamiento.text    = self.objJuego.lanzamiento ?? ""
        self.lblNombre.text         = self.objJuego.nombre ?? ""
        self.lblDescripcion.text    = self.objJuego.descripcion ?? ""
        self.lblTipo.text           = self.objJuego.tipo ?? ""
        
        let urlImagen = self.objJuego.imagen ?? ""
        let imgPlaceholder = UIImage(named: "placeholder")
        
        self.imgJuego.downloadImagenInUrl(urlImagen, withPlaceHolderImage: imgPlaceholder) { (_, imagenDescargada) in
            self.imgJuego.image = imagenDescargada
        }
        
    }

}
