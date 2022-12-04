//
//  SearchVC.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 30.11.2022.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var searchTableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    var searching = false
    var searchedData: [ResultMovie] = []
    var searchCell = "SearchCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        searchTableView.dataSource = self
        searchTableView.delegate = self
        searchTableView.register(.init(nibName: searchCell, bundle: nil), forCellReuseIdentifier: searchCell)
        SearchVM.shared.delegate = self
        
        SearchVM.shared.getMovies{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
        configureSearchController()
        searchTableView.reloadData()
    }
    
    

    private func configureSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search For Movie.."
        searchController.searchBar.searchTextField.leftView?.tintColor = .white
        searchController.searchBar.searchTextField.layer.borderWidth = 1
        searchController.searchBar.searchTextField.layer.borderColor = CGColor.init(gray: 0.9, alpha: 0.5)
        searchController.searchBar.searchTextField.layer.cornerRadius = 6
    }

}


extension SearchVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty {
            searching = true
            searchedData.removeAll()
            for resultData in SearchVM.shared.searchMovie {
                if resultData.title!.lowercased().contains(searchText.lowercased()) {
                    searchedData.append(resultData)
                }
            }
        } else {
            searching = false
            searchedData.removeAll()
            searchedData = SearchVM.shared.searchMovie
        }
        searchTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchedData.removeAll()
        searchTableView.reloadData()
    }
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedData.count
        } else {
            return SearchVM.shared.searchMovie.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: searchCell, for: indexPath) as! SearchCell
        if searching {
            let item = searchedData[indexPath.row]
            cell.configureCell(item: item)
        } else {
            let item = SearchVM.shared.searchMovie[indexPath.row]
            cell.configureCell(item: item)
        }
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        //   vc.detail = SearchVM.shared.searchMovie[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


extension SearchVC: SearchViewModelDelegate {
    func didGetMovies(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.searchTableView.reloadData()
            }
        }
    }
}
