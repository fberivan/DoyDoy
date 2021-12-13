//
//  DetayRouter.swift
//  DoyDoy
//
//  Created by Berivan on 13.12.2021.
//

import Foundation

class DetayRouter : PresenterToRouterDetayProtocol {
    static func createModule(ref: DetayVC) {
        var presenter : ViewToPresenterDetayProtocol & InteractorToPresenterDetayProtocol = DetayPresenter()
        ref.detayPresenterNesnesi = presenter
        presenter.detayInteractor = DetayInteractor()
        ref.detayPresenterNesnesi?.detayInteractor?.detayPresenter = presenter
        presenter.detayView = ref
        
    }

    
}
