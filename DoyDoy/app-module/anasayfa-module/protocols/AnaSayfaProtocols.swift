//
//  AnaSayfaProtocols.swift
//  DoyDoy
//
//  Created by Berivan on 8.12.2021.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol? {get set}
    
    func yemekleriYukle()
    func sepetYemeklerSayisiYukle(kullanici_adi: String)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumYemekleriYukle()
    func sepetYemeklerSayisiYukle(kullanici_adi: String)
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemeklerListesi:Array<Yemek>?)
    func presenteraVeriGonder(sepetYemeklerSayisi:Int)
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi:Array<Yemek>?)
    func vieweVeriGonder(sepetYemeklerSayisi:Int)
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref:AnaSayfaVC)
}
