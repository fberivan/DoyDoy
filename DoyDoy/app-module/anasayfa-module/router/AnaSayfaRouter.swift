//
//  AnaSayfaRouter.swift
//  DoyDoy
//
//  Created by Berivan on 10.12.2021.
//

import Foundation

class AnaSayfaRouter : PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnaSayfaVC) {
        let presenter : ViewToPresenterAnasayfaProtocol & InteractorToPresenterAnasayfaProtocol = AnaSayfaPresenter()
        
        //View controller için
        ref.anasayfaPresenterNesnesi = presenter
        
        //Presenter için
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor = AnaSayfaInteractor()
        ref.anasayfaPresenterNesnesi?.anasayfaView = ref
        
        //Interactor için
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor?.anasayfaPresenter = presenter
    }
    
}
