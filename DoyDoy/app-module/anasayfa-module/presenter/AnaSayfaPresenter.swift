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
        anasayfaInteractor?.tumYemekleriYukle()
    }
    
    func sepetYemeklerSayisiYukle(kullanici_adi: String) {
        anasayfaInteractor?.sepetYemeklerSayisiYukle(kullanici_adi: kullanici_adi)
    }
}

extension AnaSayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(sepetYemeklerSayisi: Int) {
        anasayfaView?.vieweVeriGonder(sepetYemeklerSayisi: sepetYemeklerSayisi)
    }
    
    func presenteraVeriGonder(yemeklerListesi: Array<Yemek>?) {
        anasayfaView?.vieweVeriGonder(yemeklerListesi: yemeklerListesi)
    }
}
