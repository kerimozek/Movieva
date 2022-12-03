//
//  ViewController.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 29.11.2022.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    let topCell = "TopCell"
    let bottomCell = "BottomCell"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      setupUI()
    }

    
    private func setupUI() {
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
        self.view.addSubview(topCollectionView)
        self.view.addSubview(bottomCollectionView)
        topCollectionView.register(.init(nibName: topCell, bundle: nil), forCellWithReuseIdentifier: topCell)
        bottomCollectionView.register(.init(nibName: bottomCell, bundle: nil), forCellWithReuseIdentifier: bottomCell)
        MainVM.shared.delegate = self
        
        MainVM.shared.getTopRated{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
        
        MainVM.shared.getPopular{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
    }

    @IBAction func segmentedControlTapped(_ sender: Any) {
        
    }
}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.topCollectionView {
            return MainVM.shared.topRated.count
            }

        return MainVM.shared.popular.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.topCollectionView {
            
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: topCell, for: indexPath) as! TopCell
            
            let item = MainVM.shared.topRated[indexPath.item]
            cellA.configureCell(item: item)
            cellA.backgroundColor = UIColor.clear
            return cellA
        } else {
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: bottomCell, for: indexPath) as! BottomCell
        
            let item = MainVM.shared.popular[indexPath.item]
            cellB.configureCell(item: item)
            cellB.backgroundColor = UIColor.clear
            return cellB
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("clicked")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.topCollectionView {
            return CGSize(width: collectionView.frame.width / 1.3 , height: collectionView.frame.height)
        } else {
            return CGSize(width: (collectionView.frame.width + 60 ) / 4 , height: (collectionView.frame.height + 40) / 2.5)
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == bottomCollectionView {
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            let height = scrollView.frame.size.height
            
            if offsetY >= contentHeight - (1.7 * height) {
                
                MainVM.shared.getPopular{ errorMessage in
                    if let errorMessage = errorMessage {
                        print("error \(errorMessage)")
                    }
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
        if isDone {
            DispatchQueue.main.async {
                self.bottomCollectionView.reloadData()
            }
        }
    }
}
