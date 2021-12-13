//
//  DetayVC.swift
//  DoyDoy
//
//  Created by Berivan on 11.12.2021.
//

import UIKit

class DetayVC: UIViewController {
    
    var detayPresenterNesnesi: ViewToPresenterDetayProtocol?
    
    var yemek: Yemek?

    @IBOutlet weak var imageBg: UIView!
    @IBOutlet weak var yemekResimIV: UIImageView!
    @IBOutlet weak var yemekAdLabel: UILabel!
    @IBOutlet weak var maliyetLabel: UILabel!
    @IBOutlet weak var sepeteEkleButton: UIButton!
    
    var yemekAdet: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetayRouter.createModule(ref: self)
        
        imageBg.addBottomRoundedEdge()

        if let y = yemek {
            resimGoster(resimAdi: y.yemek_resim_adi!)
            yemekAdLabel.text = y.yemek_adi!
            maliyetLabel.text = "₺\(y.yemek_fiyat!)"
        }
        sepeteEkleButton.isEnabled = false
    }

    @IBAction func sepeteEkle(_ sender: UIButton) {
        if let y = yemek {
            detayPresenterNesnesi?.sepeteEkle(yemek_adi: y.yemek_adi!, yemek_resim_adi: y.yemek_resim_adi!, yemek_fiyat: Int(y.yemek_fiyat!)!, yemek_siparis_adet: yemekAdet, kullanici_adi: "berivan")
        }
    }
    
    @IBAction func stepperKontrol(_ sender: UIStepper) {
        yemekAdet = Int(sender.value)
        let fiyat = Int((yemek?.yemek_fiyat!)!)!
        if yemekAdet == 0 {
            sepeteEkleButton.isEnabled = false
            maliyetLabel.text = "₺\(fiyat)"
        } else {
            sepeteEkleButton.isEnabled = true
            maliyetLabel.text = "₺\(fiyat) × \(yemekAdet) = ₺\(fiyat*yemekAdet)"
        }
    }
    
    func resimGoster(resimAdi: String) {
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)") {
            DispatchQueue.main.async {
                self.yemekResimIV.kf.setImage(with: url)
            }
        }
    }
}

extension DetayVC : PresenterToViewDetayProtocol {
    func vieweVeriGonder(basariliMi: Bool, hataMesaj: String?) {
        if basariliMi {
            let alert = UIAlertController(title: "Başarılı", message: "Ürün başarılı bir şekilde sepete eklendi.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { (action: UIAlertAction!) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Hata", message: hataMesaj!, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default))
            self.present(alert, animated: true)
        }
    }
}
