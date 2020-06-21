//
//  AgregarJuegoViewController.swift
//  UAP_3_Martin_Villa
//
//  Created by mvilla on 6/20/20.
//  Copyright © 2020 Martin Villa . All rights reserved.
//

import UIKit

class AgregarJuegoViewController: UIViewController {

    @IBOutlet weak var txtNombreJuego  : UITextField!
    @IBOutlet weak var txtTipo  : UITextField!
    @IBOutlet weak var txtDescripcion : UITextField!
    @IBOutlet weak var txtLanzamiento : UITextField!
    @IBOutlet weak var txtImagen : UITextField!

    @IBOutlet weak var loadingModelo : UIActivityIndicatorView!
    
    // scrollView
    @IBOutlet weak var scrollViewContent : UIScrollView!

    
    var objJuego: Juego!
    
    @IBAction func clickBtnAgregar(_ sender: Any) {
        
        self.loadingModelo.startAnimating()
        self.view.isUserInteractionEnabled = false
        self.perform(#selector(self.agregar), with: nil, afterDelay: 3)
    }
    
    
    @objc func agregar() {
        
        let nombre      = self.txtNombreJuego.text
        let tipo = self.txtTipo.text
        let descripcion  = self.txtDescripcion.text
        let lanzamiento   = self.txtLanzamiento.text
        let imagen   = self.txtImagen.text

                
        JuegoBL.crear( nombre: nombre, tipo: tipo, descripcion: descripcion,  lanzamiento: lanzamiento, imagen:imagen , success: { (objJuego) in
                
            self.loadingModelo.stopAnimating()
            self.view.isUserInteractionEnabled = true
            
            //JuegoBL.AgregarJuego(objJuego, enMarca: self.objMarca)
            self.navigationController?.popViewController(animated: true)
            
        }) { (mensajeError) in
            
            self.loadingModelo.stopAnimating()
            self.view.isUserInteractionEnabled = true
            
            print(mensajeError)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let centerYHeight = self.scrollViewContent.frame.height / 2
        let centerYContent = self.scrollViewContent.contentSize.height / 2
        
        let centerXWidth = self.scrollViewContent.frame.width / 2
        let centerXContent = self.scrollViewContent.contentSize.width / 2
        
        let finalPoint = CGPoint(x: centerXContent - centerXWidth, y: centerYContent - centerYHeight)
        self.scrollViewContent.setContentOffset(finalPoint, animated: true)
    }

}
