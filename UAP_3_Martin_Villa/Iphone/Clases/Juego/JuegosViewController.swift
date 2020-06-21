//
//  JuegosViewController.swift
//  UAP_3_Martin_Villa
//
//  Created by mvilla on 6/20/20.
//  Copyright © 2020 Martin Villa . All rights reserved.
//

import UIKit

class JuegosViewController: UIViewController {

   @IBOutlet weak var clvJuego: UICollectionView!
        
        var objJuego: Juego!
        var arrayJuegos = [Juego]()
        var ultimoKeyDeBusqueda = ""

        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            //self.arrayJuegos = self.objJuego.modelos?.allObjects as? [Modelo] ?? []
            self.arrayJuegos = JuegoBL.listar()
            self.clvJuego.reloadData()
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            
            if let controller = segue.destination as? DetalleJuegoViewController {
                controller.objJuego = sender as? Juego
            }
            
        }
    }

    extension JuegosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            //return 10
            return self.arrayJuegos.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cellIdentifier = "JuegoCollectionViewCell"
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! JuegoCollectionViewCell
            cell.objJuego = self.arrayJuegos[indexPath.row]
            return cell
            
          
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            let objJuego = self.arrayJuegos[indexPath.row]
            print(objJuego)
            self.performSegue(withIdentifier: "DetalleJuegoViewController", sender: objJuego)
        }
        
    }

    extension JuegosViewController: UICollectionViewDelegateFlowLayout {
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let cantidadColumnas: CGFloat = 2
            let anchoCollection = collectionView.frame.width
            let paddingLeft: CGFloat = 20.0
            let paddingRight: CGFloat = 20.0
            let separacion: CGFloat = 20.0 * (cantidadColumnas - 1)
            
            let anchoCelda = (anchoCollection - paddingLeft - paddingRight - separacion) / cantidadColumnas
            let altoCelda = anchoCelda * 1.5
            
            let tamano = CGSize(width: anchoCelda, height: altoCelda)
            return tamano
        }
 
    }

extension JuegosViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
              
        var arrayResultadoBusqueda = [Juego]()
        
        if searchText.count == 0 {
            arrayResultadoBusqueda = JuegoBL.listar()
        }else{
            arrayResultadoBusqueda = JuegoBL.listarConTextoDeBusqueda(searchText)
        }
        
        let seccion = IndexSet(integer: 0)
        
        if self.arrayJuegos.count == arrayResultadoBusqueda.count {            
            self.arrayJuegos = arrayResultadoBusqueda
            self.clvJuego.reloadSections(seccion)
            
        }else {
            self.arrayJuegos = arrayResultadoBusqueda
            
            if searchText.count >= self.ultimoKeyDeBusqueda.count {
                self.clvJuego.reloadSections(seccion)
            }else{
                self.clvJuego.reloadSections(seccion)
            }
        }
    
        self.ultimoKeyDeBusqueda = searchText
    }
}
