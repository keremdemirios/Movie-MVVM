//
//  HomeViewController.swift
//  MVVM Movie
//
//  Created by Kerem Demir on 16.10.2023.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK : UI Elements
    @IBOutlet weak var tableView: UITableView!
    
    // vide model :
    var viewmModel: MainViewModel = MainViewModel()
    
    // MARK : Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewmModel.getData()
    }
    
    // MARK : Configure
    private func configure(){
        title = "Home"
        view.backgroundColor = .red
        
        setupTableView()
        setupUI()
    }
    // MARK : Setup UI
    private func setupUI(){
        
    }
    // MARK : Functions
    
    // MARK : Actions

}

