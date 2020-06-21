//
//  JuegoTableViewCell.swift
//  UAP_3_Martin_Villa
//
//  Created by mvilla on 6/20/20.
//  Copyright © 2020 Martin Villa . All rights reserved.
//

import UIKit

class JuegoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblJuego: UILabel!
    @IBOutlet weak var imgJuego : UIImageView!


    var objJuego: Juego! {
        didSet{
            self.actualizarData()
        }
    }
    
    func actualizarData() {
        self.lblJuego.text = self.objJuego.nombre ?? "--"
        
        
        let imgPlaceholder = UIImage(named: "placeholder")
        
        self.imgJuego.downloadImagenInUrl(self.objJuego.imagen ?? "", withPlaceHolderImage: imgPlaceholder) { (urlDescarga, imagenDescargada) in
            
            if urlDescarga == self.objJuego.imagen {
                self.imgJuego.image = imagenDescargada
            }
        }
        
    }
    
    override func draw(_ rect: CGRect) {
        
        self.backgroundColor = .clear
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = false
    }
   

}
