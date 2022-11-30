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
        
        //  topCellView.backgroundColor = UIColor(red: 0.60, green: 0.66, blue: 0.97, alpha: 1.00)
//        topCellView.layer.cornerRadius = 10
//        topCellView.layer.shadowColor = UIColor.darkGray.cgColor
//        topCellView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
//        topCellView.layer.shadowRadius = 4.0
//        topCellView.layer.shadowOpacity = 0.4
//
//        topCellImageView.layer.cornerRadius = 10
//        topCellImageView.clipsToBounds = true
        
  //      topCellView.backgroundColor = UIColor.clear
    }
    
    func configureCell(item: ResultMovie) {
        //     let image = "https://i.dlpng.com/static/png/7210818_preview.png"
        self.movieLabel.text = item.title
        let imageURL = "\(NetworkHelper.shared.baseImageUrl)\(item.posterPath)"
        self.topCellImageView.kf.setImage(with: URL(string: imageURL))
    }
    
}
