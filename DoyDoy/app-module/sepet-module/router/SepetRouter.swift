//
//  SepetRouter.swift
//  DoyDoy
//
//  Created by Berivan on 14.12.2021.
//

import Foundation

class SepetRouter : PresenterToRouterSepetProtocol {
    static func createModule(ref: SepetVC) {
        var presenter: ViewToPresenterSepetProtocol & InteractorToPresenterSepetProtocol = SepetPresenter()
        presenter.sepetView = ref
        presenter.sepetInteractor = SepetInteractor()
        ref.presenterNesnesi = presenter
        ref.presenterNesnesi?.sepetInteractor?.sepetPresenter = presenter
    }
}
