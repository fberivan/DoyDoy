//
//  DetayVC.swift
//  DoyDoy
//
//  Created by Berivan on 11.12.2021.
//

import UIKit

class DetayVC: UIViewController {
    
    var yemek: Yemek?

    @IBOutlet weak var imageBg: UIView!
    @IBOutlet weak var yemekResimIV: UIImageView!
    @IBOutlet weak var yemekAdLabel: UILabel!
    @IBOutlet weak var maliyetLabel: UILabel!
    @IBOutlet weak var sepeteEkleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageBg.addBottomRoundedEdge()

        if let y = yemek {
            resimGoster(resimAdi: y.yemek_resim_adi!)
            yemekAdLabel.text = y.yemek_adi!
            maliyetLabel.text = "₺\(y.yemek_fiyat!)"
        }
        sepeteEkleButton.isEnabled = false
    }

    @IBAction func sepeteEkle(_ sender: UIButton) {
    }
    
    @IBAction func stepperKontrol(_ sender: UIStepper) {
        let count = Int(sender.value)
        let fiyat = Int((yemek?.yemek_fiyat!)!)!
        if count == 0 {
            sepeteEkleButton.isEnabled = false
            maliyetLabel.text = "₺\(fiyat)"
        } else {
            sepeteEkleButton.isEnabled = true
            maliyetLabel.text = "₺\(fiyat) × \(count) = ₺\(fiyat*count)"
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
