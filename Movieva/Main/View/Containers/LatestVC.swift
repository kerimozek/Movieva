//
//  LatestVC.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 5.12.2022.
//

import UIKit

class LatestVC: UIViewController {
    
    
    @IBOutlet weak var latestCollectionView: UICollectionView!
    
    let bottomCell = "BottomCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        latestCollectionView.delegate = self
        latestCollectionView.dataSource = self
        latestCollectionView.register(.init(nibName: bottomCell, bundle: nil), forCellWithReuseIdentifier: bottomCell)
        LatestVM.shared.delegate = self
        LatestVM.shared.getLatest{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
    }
}

extension LatestVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LatestVM.shared.latest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bottomCell, for: indexPath) as! BottomCell
        let item = LatestVM.shared.latest[indexPath.row]
        cell.configureCell(item: item)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        vc.detail = LatestVM.shared.latest[indexPath.row]
        ReviewVM.movieID = LatestVM.shared.latest[indexPath.row].id
        ContainerViewAbout.detailAbout = LatestVM.shared.latest[indexPath.row].overview
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width + 60 ) / 4 , height: (collectionView.frame.height + 40) / 2.5)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY >= contentHeight - (4 * height) {
            
            LatestVM.shared.getLatest{ errorMessage in
                if let errorMessage = errorMessage {
                    print("error \(errorMessage)")
                }
            }
            DispatchQueue.main.async {
                self.latestCollectionView.reloadData()
            }
        }
    }
}

extension LatestVC: LatestDelegate {
    func didGetLatest(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.latestCollectionView.reloadData()
            }
        }
    }
}
