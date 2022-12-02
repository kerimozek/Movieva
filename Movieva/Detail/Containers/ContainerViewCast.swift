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
    
    private func setupUI() {
        collectionViewCast.delegate = self
        collectionViewCast.dataSource = self
        collectionViewCast.register(.init(nibName: castCell, bundle: nil), forCellWithReuseIdentifier: castCell)
    }
    

}

extension ContainerViewCast: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: castCell, for: indexPath) as! CastCell
        cell.castTitle.text = "Spider Man No Way Home"
        cell.castImageView.image = UIImage(named: "spiderman")
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.3 , height: collectionView.frame.height / 2.3)
    }
    
}
