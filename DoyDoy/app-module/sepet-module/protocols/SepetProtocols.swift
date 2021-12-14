//
//  SepetProtocols.swift
//  DoyDoy
//
//  Created by Berivan on 14.12.2021.
//

import Foundation

protocol ViewToPresenterSepetProtocol {
    var sepetInteractor:PresenterToInteractorSepetProtocol? {get set}
    var sepetView:PresenterToViewSepetProtocol? {get set}
    
    func sepetiYukle(kullanici_adi: String)
    func sepetYemekSil(sepet_yemek_id: String, kullanici_adi: String)
}

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter:InteractorToPresenterSepetProtocol? {get set}
    
    func tumSepetiYukle(kullanici_adi: String)
    func sepetYemekSil(sepet_yemek_id: String, kullanici_adi: String)
}

protocol InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(yemeklerListesi:Array<SepetYemek>?)
}

protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(yemeklerListesi:Array<SepetYemek>?)
}

protocol PresenterToRouterSepetProtocol {
    static func createModule(ref:SepetVC)
}
