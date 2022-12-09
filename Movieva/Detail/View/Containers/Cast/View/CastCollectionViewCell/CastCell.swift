//
//  CastCell.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 2.12.2022.
//

import UIKit
import Kingfisher

class CastCell: UICollectionViewCell {

    @IBOutlet weak var castImageView: UIImageView!
    @IBOutlet weak var castTitle: UILabel!
    @IBOutlet weak var castCellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        castCellView.backgroundColor = UIColor.clear
        castImageView.layer.cornerRadius = 6
    }
  
    func configureCell(item: Cast) {
        self.castTitle.text = item.name
        if item.profilePath != nil {
            let image = NetworkHelper.shared.baseImageUrl + item.profilePath!
            self.castImageView.kf.setImage(with: URL(string: image))
        } else {
            let image = "https://artsmidnorthcoast.com/wp-content/uploads/2014/05/no-image-available-icon-6.png"
            self.castImageView.kf.setImage(with: URL(string: image))
        }
        self.castImageView.kf.indicatorType = .activity
    }
}
