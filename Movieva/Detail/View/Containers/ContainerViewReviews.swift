//
//  ContainerViewReviews.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 2.12.2022.
//

import UIKit

class ContainerViewReviews: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let reviewCell = "ReviewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    
    private func setupUI() {
    tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: reviewCell, bundle: nil), forCellReuseIdentifier: reviewCell)
    }
}

extension ContainerViewReviews: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reviewCell, for: indexPath) as! ReviewCell
        cell.reviewTitle.text = "Spiderman"
        cell.reviewImageView.image = UIImage(named: "spiderman")
        cell.backgroundColor = UIColor.clear
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
    }
}
