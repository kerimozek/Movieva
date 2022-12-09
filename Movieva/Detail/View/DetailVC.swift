//
//  DetailVC.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 29.11.2022.
//

import UIKit
import Kingfisher
import CoreData

class DetailVC: UIViewController {
    
    
    @IBOutlet weak var addButton: UIButton!
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
    var detail: MovieDetail?
    var buttonChange: ButtonChange = .add
    enum ButtonChange {
        case add
        case delete
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setShadow()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        CastVM.shared.movieID = DetailVM.shared.movieID
        ReviewVM.shared.movieID = DetailVM.shared.movieID
        DetailVM.shared.getMovieDetail{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
        
        for i in DetailVM.shared.favoritesArray {
            if i.movieId == "\(DetailVM.shared.movieID!)" {
                addButton.setImage(UIImage.init(named: "remove"), for: .normal)
                buttonChange = .delete
                break
            }
        }
    }
    
    private func setupUI() {
        selectedSegment.selectedSegmentIndex = 0
        selectedSegment.layer.cornerRadius = 8
        selectedSegment.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        selectedSegment.setTitleTextAttributes([.foregroundColor: UIColor(red: 0.85, green: 0.84, blue: 0.91, alpha: 1.00)], for: .normal)
        containerViewReviews.alpha = 0
        containerViewCast.alpha = 0
        DetailVM.shared.fetchData()
        DetailVM.shared.delegate = self
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
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let detail = detail else { return }
        if buttonChange == .add {
            DetailVM.shared.saveData(title: detail.title!, detail: detail.overview!, movieId: "\(detail.id!)", image: detail.posterPath!, imdb: "\(detail.voteAverage!)", origin: detail.originalLanguage!)
            
            addButton.setImage(UIImage.init(named: "remove"), for: .normal)
            buttonChange = .delete
        } else {
            
            DetailVM.shared.deleteData(index: "\(detail.id!)")
            addButton.setImage(UIImage.init(named: "add"), for: .normal)
            buttonChange = .add
        }
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

extension DetailVC: DetailDelegate {
    func didGetMovie(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.detail = DetailVM.shared.movieDetail
                let image = NetworkHelper.shared.baseBackImageUrl + (self.detail?.backdropPath!)!
                let image2 = NetworkHelper.shared.baseImageUrl + (self.detail?.posterPath!)!
                self.imageViewTop.kf.setImage(with: URL(string: image))
                self.imageViewBottom.kf.setImage(with: URL(string: image2))
                self.movieLabel.text = self.detail?.title
                self.movieDate.text = self.detail?.releaseDate
                self.moviePoint.text = "\(self.detail?.voteAverage ?? 6.9)"
                self.movieOrigin.text = self.detail?.originalLanguage?.uppercased()
            }
        }
    }
}
