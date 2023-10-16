//
//  MainViewController+TableView.swift
//  MVVM Movie
//
//  Created by Kerem Demir on 16.10.2023.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .clear
        registerCells()
    }
    
    func registerCells(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewmModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}