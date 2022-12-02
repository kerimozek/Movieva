//
//  TopCell.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 30.11.2022.
//

import UIKit
import Kingfisher

class TopCell: UICollectionViewCell {
    
    @IBOutlet weak var topCellView: UIView!
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var topCellImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        topCellView.backgroundColor = UIColor(red: 0.60, green: 0.66, blue: 0.97, alpha: 1.00)
        topCellView.layer.cornerRadius = 10
        topCellView.layer.shadowColor = UIColor.darkGray.cgColor
        topCellView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        topCellView.layer.shadowRadius = 4.0
        topCellView.layer.shadowOpacity = 0.4
        
        topCellImageView.layer.cornerRadius = 10
        topCellImageView.clipsToBounds = true
    }
    
    func configureCell(item: ResultMovie) {

        let image2 = "https://images5.alphacoders.com/111/1111276.jpg"
        self.movieLabel.text = item.title
        if item.posterPath != nil {
            let image = NetworkHelper.shared.baseImageUrl + item.posterPath!
            self.topCellImageView.kf.setImage(with: URL(string: image))
        } else {
            self.topCellImageView.kf.setImage(with: URL(string: image2))
        }
    }
}
