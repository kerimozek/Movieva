//
//  UpcomingVC.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 5.12.2022.
//

import UIKit

class UpcomingVC: UIViewController {
    
    
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    let bottomCell = "BottomCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        upcomingCollectionView.delegate = self
        upcomingCollectionView.dataSource = self
        upcomingCollectionView.register(.init(nibName: bottomCell, bundle: nil), forCellWithReuseIdentifier: bottomCell)
        MainVM.shared.getLatest{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
    }
}

extension UpcomingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MainVM.shared.latest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bottomCell, for: indexPath) as! BottomCell
        let item = MainVM.shared.latest[indexPath.row]
        cell.configureCell(item: item)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width + 60 ) / 4 , height: (collectionView.frame.height + 40) / 2.5)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY >= contentHeight - (4 * height) {
            
            MainVM.shared.getLatest{ errorMessage in
                if let errorMessage = errorMessage {
                    print("error \(errorMessage)")
                }
            }
            DispatchQueue.main.async {
                self.upcomingCollectionView.reloadData()
            }
        }
    }
}

extension UpcomingVC: MainVMDelegate {
    func didGetLatest(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.upcomingCollectionView.reloadData()
            }
        }
    }
    
    func didGetPopular(isDone: Bool) {
    }
    
    func didGetTopRated(isDone: Bool) {
    }
}
