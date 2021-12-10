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
    
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumYemekleriYukle()
    
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemeklerListesi:Array<Yemek>)
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi:Array<Yemek>)
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref:AnaSayfaVC)
}
