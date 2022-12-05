//
//  DetailVC.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 29.11.2022.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var imageViewTop: UIImageView!
    @IBOutlet weak var containerViewAbout: UIView!
    @IBOutlet weak var containerViewReviews: UIView!
    @IBOutlet weak var containerViewCast: UIView!
    @IBOutlet weak var littleView: UIView!
    @IBOutlet weak var imageViewBottom: UIImageView!
    @IBOutlet weak var selectedSegment: UISegmentedControl!
    
    var detail: BaseModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        imageViewBottom.layer.cornerRadius = 6
        selectedSegment.selectedSegmentIndex = 0
        selectedSegment.layer.cornerRadius = 8
        selectedSegment.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        selectedSegment.setTitleTextAttributes([.foregroundColor: UIColor(red: 0.85, green: 0.84, blue: 0.91, alpha: 1.00)], for: .normal)
        containerViewReviews.alpha = 0
        containerViewCast.alpha = 0
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
