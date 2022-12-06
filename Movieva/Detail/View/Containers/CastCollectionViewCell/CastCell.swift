//
//  CastCell.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 2.12.2022.
//

import UIKit

class CastCell: UICollectionViewCell {

    @IBOutlet weak var castImageView: UIImageView!
    @IBOutlet weak var castTitle: UILabel!
    @IBOutlet weak var castCellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        castCellView.backgroundColor = UIColor.clear
        castImageView.layer.cornerRadius = 6
    }

}
