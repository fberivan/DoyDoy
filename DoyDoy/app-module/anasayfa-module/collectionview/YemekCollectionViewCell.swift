//
//  YemekCollectionViewCell.swift
//  DoyDoy
//
//  Created by Berivan on 11.12.2021.
//

import UIKit
import Kingfisher

class YemekCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var contentContainer: UIView!
    @IBOutlet weak var yemekIV: UIImageView!
    @IBOutlet weak var yemekAdiLabel: UILabel!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    
    func setupViews() {
        contentContainer.layer.borderColor = UIColor.systemYellow.cgColor
        contentContainer.layer.borderWidth = 1
        contentContainer.layer.cornerRadius = 20
        
        contentContainer.layer.shadowColor = UIColor.gray.cgColor
        contentContainer.layer.shadowOpacity = 0.3
        contentContainer.layer.shadowOffset = CGSize.zero
        contentContainer.layer.shadowRadius = 6
        
        yemekIV.layer.borderColor = UIColor.systemGray4.cgColor
        yemekIV.layer.borderWidth = 2
        yemekIV.layer.cornerRadius = 60
    }
    
    func resimGoster(resimAdi: String) {
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)") {
            DispatchQueue.main.async {
                self.yemekIV.kf.setImage(with: url)
            }
        }
    }
}
