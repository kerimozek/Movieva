//
//  ViewController.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 29.11.2022.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var upcomingCollectionView: UIView!
    @IBOutlet weak var popularCollectionView: UIView!
    @IBOutlet weak var latestCollectionView: UIView!
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    let topCell = "TopCell"

 
    override func viewDidLoad() {
        super.viewDidLoad()
      setupUI()
    }

    private func setupUI() {
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        segmentedControl.layer.cornerRadius = 8
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor(red: 0.85, green: 0.84, blue: 0.91, alpha: 1.00)], for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        self.popularCollectionView.alpha = 0
        self.upcomingCollectionView.alpha = 0
        self.view.addSubview(topCollectionView)
        topCollectionView.register(.init(nibName: topCell, bundle: nil), forCellWithReuseIdentifier: topCell)
        MainVM.shared.delegate = self
        
        MainVM.shared.getTopRated{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
    }

    @IBAction func segmentedControlTapped(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.3, animations: {
                self.latestCollectionView.alpha = 1
                self.popularCollectionView.alpha = 0
                self.upcomingCollectionView.alpha = 0
            })
        } else  if sender.selectedSegmentIndex == 1 {
            UIView.animate(withDuration: 0.3, animations: {
                self.latestCollectionView.alpha = 0
                self.popularCollectionView.alpha = 1
                self.upcomingCollectionView.alpha = 0
            })
        } else  {
            UIView.animate(withDuration: 0.3, animations: {
                self.latestCollectionView.alpha = 0
                self.popularCollectionView.alpha = 0
                self.upcomingCollectionView.alpha = 1
            })
            
        }
    }
}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return MainVM.shared.topRated.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: topCell, for: indexPath) as! TopCell
        
        let item = MainVM.shared.topRated[indexPath.item]
        cellA.configureCell(item: item)
        cellA.backgroundColor = UIColor.clear
        return cellA
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("clicked")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 1.3 , height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let offsetX = scrollView.contentOffset.x
        let contentWidth = scrollView.contentSize.width
        let width = scrollView.frame.size.width
        
        if offsetX >= contentWidth - (3 * width) {
            MainVM.shared.getTopRated{ errorMessage in
                if let errorMessage = errorMessage {
                    print("error \(errorMessage)")
                }
            }
        }
    }
}

extension MainVC: MainVMDelegate {
    func didGetTopRated(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.topCollectionView.reloadData()
            }
        }
    }
 
    func didGetPopular(isDone: Bool) {
    }
    func didGetLatest(isDone: Bool) {
    }
}
