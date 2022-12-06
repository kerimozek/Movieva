//
//  DetailVC.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 29.11.2022.
//

import UIKit
import Kingfisher

class DetailVC: UIViewController {

    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var imageViewTop: UIImageView!
    @IBOutlet weak var containerViewAbout: UIView!
    @IBOutlet weak var containerViewReviews: UIView!
    @IBOutlet weak var containerViewCast: UIView!
    @IBOutlet weak var littleView: UIView!
    @IBOutlet weak var imageViewBottom: UIImageView!
    @IBOutlet weak var selectedSegment: UISegmentedControl!
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var moviePoint: UILabel!
    @IBOutlet weak var movieOrigin: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    var detail: BaseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setShadow()
        setValues()
    }
    
    private func setupUI() {
        selectedSegment.selectedSegmentIndex = 0
        selectedSegment.layer.cornerRadius = 8
        selectedSegment.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        selectedSegment.setTitleTextAttributes([.foregroundColor: UIColor(red: 0.85, green: 0.84, blue: 0.91, alpha: 1.00)], for: .normal)
        containerViewReviews.alpha = 0
        containerViewCast.alpha = 0
        backView.layer.cornerRadius = 10
        backView.alpha = 0.7
        backButton.tintColor = UIColor(red: 0.08, green: 0.06, blue: 0.22, alpha: 1.00)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setValues() {
        let image = NetworkHelper.shared.baseImageUrl + (detail?.backdrop_path!)!
        let image2 = NetworkHelper.shared.baseImageUrl + (detail?.poster_path!)!
        self.imageViewTop.kf.setImage(with: URL(string: image))
        self.imageViewBottom.kf.setImage(with: URL(string: image2))
        self.movieLabel.text = detail?.title
        self.movieDate.text = detail?.release_date
        self.moviePoint.text = "\(detail?.vote_average ?? 6.9)"
        self.movieOrigin.text = detail?.original_language?.uppercased()
    }
    
    private func setShadow() {
        littleView.layer.cornerRadius = 10
        littleView.layer.shadowColor = UIColor(red: 0.08, green: 0.06, blue: 0.22, alpha: 1.00).cgColor
        littleView.layer.shadowOffset = CGSize(width: 6.0, height: 6.0)
        littleView.layer.shadowRadius = 4.0
        littleView.layer.shadowOpacity = 1
        imageViewBottom.layer.cornerRadius = 6
        imageViewBottom.clipsToBounds = true
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeContainer(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.3, animations: {
                self.containerViewAbout.alpha = 1
                self.containerViewReviews.alpha = 0
                self.containerViewCast.alpha = 0
            })
        } else  if sender.selectedSegmentIndex == 1 {
            UIView.animate(withDuration: 0.3, animations: {
                self.containerViewAbout.alpha = 0
                self.containerViewReviews.alpha = 1
                self.containerViewCast.alpha = 0
            })
        } else  {
            UIView.animate(withDuration: 0.3, animations: {
                self.containerViewAbout.alpha = 0
                self.containerViewReviews.alpha = 0
                self.containerViewCast.alpha = 1
            })
        }
    }
}
