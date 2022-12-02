//
//  ReviewCell.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 2.12.2022.
//

import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var reviewImageView: UIImageView!
    @IBOutlet weak var reviewTitle: UILabel!
    @IBOutlet weak var reviewDetail: UILabel!
    
    @IBOutlet weak var reviewCellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        reviewImageView.layer.cornerRadius = 6
        reviewCellView.layer.cornerRadius = 8
    }

    
}
