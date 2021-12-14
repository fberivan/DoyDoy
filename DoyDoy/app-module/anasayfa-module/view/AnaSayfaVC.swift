//
//  ViewController.swift
//  DoyDoy
//
//  Created by Berivan on 8.12.2021.
//

import UIKit

class AnaSayfaVC: UIViewController {
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    @IBOutlet weak var yemeklerCV: UICollectionView!
    
    var yemekler = [Yemek]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AnaSayfaRouter.createModule(ref: self)
        
        yemeklerCV.delegate = self
        yemeklerCV.dataSource = self
        
        let genislik = yemeklerCV.frame.size.width
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        let itemGenislik = (genislik - 30) / 2
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.15)
        yemeklerCV.collectionViewLayout = tasarim
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.yemekleriYukle()
    }

}

extension AnaSayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Yemek>?) {
        if let yemekler = yemeklerListesi {
            self.yemekler = yemekler
            DispatchQueue.main.async {
                self.yemeklerCV.reloadData()
            }
        } else {
            let alert = UIAlertController(title: "Hata", message: "Yemek listesi yüklenemedi! İnternet bağlantınızı kontrol ediniz.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { (action: UIAlertAction!) in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true)
        }
    }
}

extension AnaSayfaVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yemekler.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let yemek = yemekler[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yemekHucre", for: indexPath) as! YemekCollectionViewCell
        
        cell.setupViews()
        cell.resimGoster(resimAdi: yemek.yemek_resim_adi!)
        cell.yemekAdiLabel.text = yemek.yemek_adi!
        cell.yemekFiyatLabel.text = "₺\(yemek.yemek_fiyat!)"
        /*cell.filmIV.image = UIImage(named: yemek.resim_ad!)
        cell.baslikLabel.text = film.ad!
        cell.fiyatLabel.text = "\(film.fiyat!) ₺"*/
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yemek = yemekler[indexPath.row]
        performSegue(withIdentifier: "goToDetay", sender: yemek)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetay" {
            let yemek = sender as? Yemek
            let targetVC = segue.destination as! DetayVC
            targetVC.yemek = yemek
        }
    }
}
