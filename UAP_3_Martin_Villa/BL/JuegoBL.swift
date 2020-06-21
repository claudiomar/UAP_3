//
//  JuegoBL.swift
//  UAP_3_Martin_Villa
//
//  Created by mvilla on 6/20/20.
//  Copyright © 2020 Martin Villa . All rights reserved.
//

import Foundation
import UIKit

class JuegoBL{
    
    typealias AgregarJuego = (_ objJuego: Juego) -> Void
    typealias MensajeError = (_ mensaje: String) -> Void
    
    /*
    class func agregarJuego(_ objJuego: Juego) {
        
        let instanciaAppDelegate = UIApplication.shared.delegate as! AppDelegate
    
        objJuego.addTo
        objJuego.addToModelos(objModelo)
        //objModelo.marca = objMarca
        
        objJuego.
        
        instanciaAppDelegate.saveContext()
    }
 */
    
    class func crear(nombre: String?, tipo: String?, descripcion: String?, lanzamiento:String? , imagen:String? ,success: AgregarJuego, mensajeError: MensajeError) {
            
        guard let nombreSeguro = nombre, nombreSeguro.count != 0 else {
            mensajeError("Ingresa un nombre correcto")
            return
        }
        
        guard let tipoSeguro = tipo, tipoSeguro.count != 0 else {
            mensajeError("Ingresa un tipo correcto")
            return
        }
        
        guard let descripcionSeguro = descripcion, descripcionSeguro.count != 0 else {
            mensajeError("Ingresa una descripcion correcta")
            return
        }
        
        guard let lanzamientoSeguro = lanzamiento, lanzamientoSeguro.count != 0 else {
            mensajeError("Ingresa una fecha de lanzamiento correcta")
            return
        }
        
        guard let imagenSeguro = imagen, imagenSeguro.count != 0 else {
            mensajeError("Ingresa una imagen correcta")
            return
        }
        
        let instanciaAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexto = instanciaAppDelegate.persistentContainer.viewContext
        
        let objJuego = JuegoDA.crear(nombre: nombreSeguro, tipo: tipoSeguro, descripcion: descripcionSeguro, lanzamiento: lanzamientoSeguro , imagen: imagenSeguro ,contexto: contexto)
        instanciaAppDelegate.saveContext()
        
        success(objJuego)
    }
    
    class func listar() -> [Juego] {
        
        let instanciaAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexto = instanciaAppDelegate.persistentContainer.viewContext
        
        let arrayResultado = JuegoDA.listar(contexto: contexto)
        return arrayResultado
    }
    
    class func listarConTextoDeBusqueda(_ texto: String) -> [Juego] {
        
        let instanciaAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexto = instanciaAppDelegate.persistentContainer.viewContext
        
        let arrayResultado = JuegoDA.listarConTextoDeBusqueda(texto, contexto: contexto)
        return arrayResultado
    }
    
    class func eliminar(_ objJuego: Juego) {
        
        let instanciaAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexto = instanciaAppDelegate.persistentContainer.viewContext
        contexto.delete(objJuego)
        instanciaAppDelegate.saveContext()
    }
    
}
