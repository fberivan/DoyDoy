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
    @IBOutlet weak var searchBar: UISearchBar!
    
    var yemekler = [Yemek]()
    var filteredYemekler = [Yemek]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AnaSayfaRouter.createModule(ref: self)
        
        searchBar.delegate = self
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

extension AnaSayfaVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredYemekler = self.yemekler.filter { yemek in
            if yemek.yemek_adi!.lowercased().contains(searchText.lowercased()) {
                return true
            }
            if searchText.isEmpty {
                return true
            }
            return false
        }
        self.yemeklerCV.reloadData()
    }
}

extension AnaSayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Yemek>?) {
        if let yemekler = yemeklerListesi {
            self.yemekler = yemekler
            self.filteredYemekler = yemekler
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
        return filteredYemekler.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let yemek = filteredYemekler[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yemekHucre", for: indexPath) as! YemekCollectionViewCell
        
        cell.setupViews()
        cell.resimGoster(resimAdi: yemek.yemek_resim_adi!)
        cell.yemekAdiLabel.text = yemek.yemek_adi!
        cell.yemekFiyatLabel.text = "₺\(yemek.yemek_fiyat!)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yemek = filteredYemekler[indexPath.row]
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
