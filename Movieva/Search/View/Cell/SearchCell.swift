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
        searchImageView.layer.cornerRadius = 16
        searchCellView.layer.cornerRadius = 16
    }


    func configureCell(item: ResultMovie) {
        self.movieTitle.text = item.title
        self.movieMinutes.text = item.release_date
        self.movieGenre.text = "\(item.vote_average ?? 7.8)"
        self.movieYear.text = item.original_language?.uppercased()
        let image = NetworkHelper.shared.baseImageUrl + item.poster_path!
        self.searchImageView.kf.setImage(with: URL(string: image))
    }
}
