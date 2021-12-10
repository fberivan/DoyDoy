//
//  ViewController.swift
//  DoyDoy
//
//  Created by Berivan on 8.12.2021.
//

import UIKit

class AnaSayfaVC: UIViewController {
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AnaSayfaRouter.createModule(ref: self)
        
     
    }


}

extension AnaSayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Yemek>) {
        
    }
    
    
    
}
