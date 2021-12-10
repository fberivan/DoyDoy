//
//  AnaSayfaPresenter.swift
//  DoyDoy
//
//  Created by Berivan on 10.12.2021.
//

import Foundation

class AnaSayfaPresenter : ViewToPresenterAnasayfaProtocol{
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func yemekleriYukle() {
        
    }
}

extension AnaSayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemeklerListesi: Array<Yemek>) {
        
    }
}
       
       

