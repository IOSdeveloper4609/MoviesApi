//
//  ViewController.swift
//  apiAPI
//
//  Created by Азат Киракосян on 21.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    var tableView = UITableView()
    let Identifier = "Cell"
    var apiService = ApiService()
    var cellModels = [MyTableViewCellModel]()
    let searchController = UISearchController(searchResultsController: nil)
    var filteredStudents = [MyTableViewCellModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMoviesData()
        createTableView()
        setupViewController()
        createSearchBar()
    }
    
    
    private func createSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
    }
    
    private func createTableView() {
        
        tableView.rowHeight = 170
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: Identifier)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    private func getMoviesData() {
        
        apiService.getMovies(api: "\(popularMoviesURL)") { results in
            var cellModels = [MyTableViewCellModel]()
            
            for movie in results.movies {
                let model = MyTableViewCellModel(movie: movie)
                cellModels.append(model)
            }
            
            self.cellModels = cellModels
            self.filteredStudents = cellModels
            self.tableView.reloadData()
        }
    }
    
    private func setupViewController() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = " Movies 2020 "
    }
}






