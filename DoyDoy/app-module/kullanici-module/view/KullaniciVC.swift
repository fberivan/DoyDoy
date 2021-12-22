//
//  KullaniciVC.swift
//  DoyDoy
//
//  Created by Berivan on 17.12.2021.
//

import UIKit

class KullaniciVC: UIViewController {

    @IBOutlet weak var kullaniciAdiLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var kullaniciAdiTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.loadGif(name: "profile")
        
        kullaniciAdiLabel.text = "Merhaba, \(appDelegate.getKullaniciAdi())"
        kullaniciAdiTF.text = appDelegate.getKullaniciAdi()
        
    }

    @IBAction func kaydet(_ sender: UIButton) {
        UserDefaults.standard.set(kullaniciAdiTF.text, forKey: "kullanici_adi")
        kullaniciAdiLabel.text = "Merhaba, \(appDelegate.getKullaniciAdi())"
    }
}
