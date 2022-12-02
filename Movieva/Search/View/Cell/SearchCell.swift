//
//  SearchCell.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 30.11.2022.
//

import UIKit
import Kingfisher

class SearchCell: UITableViewCell {

    @IBOutlet weak var searchCellView: UIView!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieMinutes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        searchCellView.backgroundColor = UIColor(red: 0.60, green: 0.66, blue: 0.97, alpha: 1.00)
        searchCellView.layer.cornerRadius = 10
        searchCellView.layer.shadowColor = UIColor.darkGray.cgColor
        searchCellView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        searchCellView.layer.shadowRadius = 4.0
        searchCellView.layer.shadowOpacity = 0.4
        
        searchImageView.layer.cornerRadius = 10
        searchImageView.clipsToBounds = true
    }

    func configureCell(item: ResultMovie) {
        let image2 = "https://images5.alphacoders.com/111/1111276.jpg"
        self.movieTitle.text = item.title
        if item.posterPath != nil {
            let image = NetworkHelper.shared.baseImageUrl + item.posterPath!
            self.searchImageView.kf.setImage(with: URL(string: image))
        } else {
            self.searchImageView.kf.setImage(with: URL(string: image2))
        }
        self.movieGenre.text = item.originalLanguage
        self.movieYear.text = item.releaseDate
        self.movieMinutes.text = "\(item.popularity ?? 31)"
    }
    
}
