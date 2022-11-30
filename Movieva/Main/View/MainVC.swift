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
        topCollectionView.register(.init(nibName: topCell, bundle: nil), forCellWithReuseIdentifier: topCell)
        bottomCollectionView.register(.init(nibName: bottomCell, bundle: nil), forCellWithReuseIdentifier: bottomCell)
    }

    @IBAction func segmentedControlTapped(_ sender: Any) {
        
    }
}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("clicked")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        <#code#>
    }
}
