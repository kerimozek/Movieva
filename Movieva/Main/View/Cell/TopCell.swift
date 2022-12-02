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
        
    //    topCellView.backgroundColor = UIColor(red: 0.85, green: 0.20, blue: 0.31, alpha: 1.00)
        topCellView.layer.cornerRadius = 10
        topCellView.layer.shadowColor = UIColor.darkGray.cgColor
        topCellView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        topCellView.layer.shadowRadius = 4.0
        topCellView.layer.shadowOpacity = 0.4
        
        topCellImageView.layer.cornerRadius = 10
        topCellImageView.clipsToBounds = true
    }
    
    func configureCell(item: ResultMovie) {

        let image2 = "https://static.wikia.nocookie.net/jujutsu-kaisen/images/5/5a/Satoru_Gojo_arrives_on_the_battlefield_%28Anime%29.png/revision/latest?cb=20210226205256"
        self.movieLabel.text = item.title
        if item.posterPath != nil {
            let image = NetworkHelper.shared.baseImageUrl + item.posterPath!
            self.topCellImageView.kf.setImage(with: URL(string: image))
        } else {
            self.topCellImageView.kf.setImage(with: URL(string: image2))
        }
    }
}
