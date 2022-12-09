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
    
    override func viewWillAppear(_ animated: Bool) {
        ReviewVM.shared.getReviews{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
    }

    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: reviewCell, bundle: nil), forCellReuseIdentifier: reviewCell)
        tableView.rowHeight  = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        ReviewVM.shared.delegate = self
    }
}

extension ContainerViewReviews: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReviewVM.shared.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reviewCell, for: indexPath) as! ReviewCell
        let item = ReviewVM.shared.reviews[indexPath.row]
        cell.configureCell(item: item)
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped review")
    }
}

extension ContainerViewReviews: ReviewDelegate {
    func didGetReviews(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
