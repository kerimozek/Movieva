//
//  WatchListVC.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 30.11.2022.
//

import UIKit

class WatchListVC: UIViewController {

    
    @IBOutlet weak var watchListTableView: UITableView!
    let watchListCell = "WatchListCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    

    private func setupUI() {
        watchListTableView.delegate = self
        watchListTableView.dataSource = self
        watchListTableView.register(.init(nibName: watchListCell, bundle: nil), forCellReuseIdentifier: watchListCell)
        WatchListVM.shared.delegate = self
        
        WatchListVM.shared.getMovies{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
        watchListTableView.reloadData()
    }
}

extension WatchListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WatchListVM.shared.watchListMovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: watchListCell, for: indexPath) as! WatchListCell
        let item = WatchListVM.shared.watchListMovie[indexPath.row]
        cell.configureCell(item: item)
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped watchlist")
    }
    
    
}

extension WatchListVC: WatchListViewModelDelegate {
    func didGetMovies(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.watchListTableView.reloadData()
            }
        }
    }
}
