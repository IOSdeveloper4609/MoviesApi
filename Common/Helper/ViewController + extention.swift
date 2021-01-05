//
//  Extentions.swift
//  apiAPI
//
//  Created by Азат Киракосян on 03.01.2021.
//

import UIKit

extension ViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier, for: indexPath) as! MyTableViewCell
        cell.setupWithModel(model: filteredStudents[indexPath.row])
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
 }


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let detailVC = DetailViewController(myTableViewCellModel: filteredStudents[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
}


extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchValue = searchController.searchBar.text?.lowercased() ?? ""
        
        if searchValue.isEmpty {
            filteredStudents = cellModels
        } else {
            filteredStudents = cellModels.filter {
                $0.titleMovie?.lowercased().hasPrefix(searchValue) ?? false ||
                    $0.rateMovie?.lowercased().hasPrefix(searchValue) ?? false 
            }
        }
        self.tableView.reloadData()
    }
}

