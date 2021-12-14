//
//  TableViewHucre.swift
//  DoyDoy
//
//  Created by Berivan on 14.12.2021.
//

import UIKit

class TableViewHucre: UITableViewCell {

    @IBOutlet weak var contentContainer: UIView!
    @IBOutlet weak var yemekIV: UIImageView!
    @IBOutlet weak var yemekAdiLabel: UILabel!
    @IBOutlet weak var yemekTutarLAbel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupViews() {
        contentContainer.layer.cornerRadius = 20
        
        contentContainer.layer.shadowColor = UIColor.gray.cgColor
        contentContainer.layer.shadowOpacity = 0.3
        contentContainer.layer.shadowOffset = CGSize.zero
        contentContainer.layer.shadowRadius = 6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func resimGoster(resimAdi: String) {
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)") {
            DispatchQueue.main.async {
                self.yemekIV.kf.setImage(with: url)
            }
        }
    }

}
