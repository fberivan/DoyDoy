//
//  SepetPresenter.swift
//  DoyDoy
//
//  Created by Berivan on 14.12.2021.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol {
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    var sepetView: PresenterToViewSepetProtocol?
    
    func sepetiYukle(kullanici_adi: String) {
        sepetInteractor?.tumSepetiYukle(kullanici_adi: kullanici_adi)
    }
    
    func sepetYemekSil(sepet_yemek_id: String, kullanici_adi: String) {
        sepetInteractor?.sepetYemekSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
}

extension SepetPresenter : InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(yemeklerListesi: Array<SepetYemek>?) {
        sepetView?.vieweVeriGonder(yemeklerListesi: yemeklerListesi)
    }
}
