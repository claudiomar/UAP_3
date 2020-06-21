//
//  JuegoDA.swift
//  UAP_3_Martin_Villa
//
//  Created by mvilla on 6/20/20.
//  Copyright © 2020 Martin Villa . All rights reserved.
//

import Foundation
import CoreData

class JuegoDA{
    
    class func crear(nombre:String, tipo:String, descripcion:String, lanzamiento:String, imagen:String , contexto:NSManagedObjectContext) -> Juego{
        
        let objDM = NSEntityDescription.insertNewObject(forEntityName: "Juego", into: contexto) as! Juego
        
        objDM.nombre = nombre
        objDM.tipo = tipo
        objDM.descripcion = descripcion
        objDM.lanzamiento = lanzamiento
        objDM.imagen = imagen
        
        return objDM
    }
    
    class func listar(contexto:NSManagedObjectContext)->[Juego]{
        
        let fetchRequest:NSFetchRequest<Juego> = Juego.fetchRequest()
        
        
        let sortTipo = NSSortDescriptor(key: "tipo", ascending: false)
        let sortNombre = NSSortDescriptor(key: "nombre", ascending: true)
       
        fetchRequest.sortDescriptors = [sortTipo, sortNombre]
       
        do {
           let arrayResultado = try contexto.fetch(fetchRequest)
           return arrayResultado
        }catch {
           return []
        }
        
    }
    
    class func listarConTextoDeBusqueda(_ texto: String, contexto: NSManagedObjectContext) -> [Juego] {
        
        let fetchRequest: NSFetchRequest<Juego> = Juego.fetchRequest()
        
        //let predicado = NSPredicate(format: "nombre contains[c] %@ OR tipo contains[c] %@", texto, texto)
        
        // busqueda por nombre
        let predicado = NSPredicate(format: "nombre contains[c] %@", texto)

        fetchRequest.predicate = predicado
        
        let sortTipo = NSSortDescriptor(key: "tipo", ascending: false)
        let sortNombre = NSSortDescriptor(key: "nombre", ascending: true)
        
        fetchRequest.sortDescriptors = [sortTipo, sortNombre]
        
        do {
            let arrayResultado = try contexto.fetch(fetchRequest)
            return arrayResultado
        }catch {
            return []
        }
    }
    
}
