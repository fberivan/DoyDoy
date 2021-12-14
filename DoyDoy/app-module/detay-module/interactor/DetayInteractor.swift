//
//  DetayInteractor.swift
//  DoyDoy
//
//  Created by Berivan on 13.12.2021.
//

import Foundation
import Alamofire

class DetayInteractor : PresenterToInteractorDetayProtocol{
    
    var detayPresenter: InteractorToPresenterDetayProtocol?

    func sepeteEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String) {
        let params: Parameters = ["yemek_adi": yemek_adi, "yemek_resim_adi": yemek_resim_adi, "yemek_fiyat": yemek_fiyat, "yemek_siparis_adet": yemek_siparis_adet, "kullanici_adi": kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters: params).responseJSON { response in
            if let data = response.data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                        if let success = json["success"] as? Int, let message = json["message"] as? String {
                            if success == 1 {
                                self.detayPresenter?.presenteraVeriGonder(basariliMi: true, hataMesaj: nil)
                            } else {
                                self.detayPresenter?.presenteraVeriGonder(basariliMi: false, hataMesaj: message)
                            }
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                self.detayPresenter?.presenteraVeriGonder(basariliMi: false, hataMesaj: "Yemek sepete eklenemedi! İnternet bağlantınızı kontrol ediniz.")
            }
        }
    }

}
