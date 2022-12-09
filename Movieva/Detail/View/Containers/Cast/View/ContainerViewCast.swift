//
//  ContainerViewCast.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 2.12.2022.
//

import UIKit

class ContainerViewCast: UIViewController {
    
    let castCell = "CastCell"
    @IBOutlet weak var collectionViewCast: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        CastVM.shared.getCast{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
    }
    
    private func setupUI() {
        collectionViewCast.delegate = self
        collectionViewCast.dataSource = self
        collectionViewCast.register(.init(nibName: castCell, bundle: nil), forCellWithReuseIdentifier: castCell)
        CastVM.shared.delegate = self
    }
    

}

extension ContainerViewCast: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CastVM.shared.cast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: castCell, for: indexPath) as! CastCell
        let item = CastVM.shared.cast[indexPath.row]
        cell.configureCell(item: item)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 4 , height: collectionView.frame.height / 2.3)
    }
    
}

extension ContainerViewCast: CastDelegate {
    func didGetCast(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.collectionViewCast.reloadData()
            }
        }
    }
}
