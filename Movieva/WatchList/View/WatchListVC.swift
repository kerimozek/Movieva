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
    
    override func viewWillAppear(_ animated: Bool) {
        WatchListVM.shared.fetchData()
        watchListTableView.reloadData()
    }

    private func setupUI() {
        watchListTableView.delegate = self
        watchListTableView.dataSource = self
        watchListTableView.register(.init(nibName: watchListCell, bundle: nil), forCellReuseIdentifier: watchListCell)
        WatchListVM.shared.delegate = self
    }
}

extension WatchListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WatchListVM.shared.favoritesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: watchListCell, for: indexPath) as! WatchListCell
        let item = WatchListVM.shared.favoritesArray[indexPath.row]
        cell.configureCell(item: item)
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        let item = WatchListVM.shared.favoritesArray[indexPath.row]
        vc.detailId = item.movieId
        
       
        navigationController?.pushViewController(vc, animated: true)
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
