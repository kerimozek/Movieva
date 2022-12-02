//
//  WatchListCell.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 30.11.2022.
//

import UIKit

class WatchListCell: UITableViewCell {

    
    @IBOutlet weak var watchListCellView: UIView!
    @IBOutlet weak var watchListImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var movieMinutes: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        watchListImageView.backgroundColor = UIColor(red: 0.85, green: 0.20, blue: 0.31, alpha: 1.00)
        watchListImageView.layer.cornerRadius = 10
        watchListImageView.layer.shadowColor = UIColor.darkGray.cgColor
        watchListImageView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        watchListImageView.layer.shadowRadius = 4.0
        watchListImageView.layer.shadowOpacity = 0.4
        
        watchListImageView.layer.cornerRadius = 10
        watchListImageView.clipsToBounds = true
    }

    func configureCell(item: ResultMovie) {
        let image2 = "https://pbs.twimg.com/media/E_FxqkSVgAQZKPM.jpg"
        self.movieTitle.text = item.title
        if item.posterPath != nil {
            let image = NetworkHelper.shared.baseImageUrl + item.posterPath!
            self.watchListImageView.kf.setImage(with: URL(string: image))
        } else {
            self.watchListImageView.kf.setImage(with: URL(string: image2))
        }
    //    self.genreLabel.text = item.originalLanguage
    //    self.movieMinutes.text = item.releaseDate
        self.detailLabel.text = item.overview
    }

}
