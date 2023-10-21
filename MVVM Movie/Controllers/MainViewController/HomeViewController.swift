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
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    // View model :
    var viewmModel: HomeViewModel = HomeViewModel()
    
    // Variables :
    var cellDataSource: [Movie] = []
    // MARK : Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
    func bindViewModel(){
        viewmModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicatorView.startAnimating()
                } else {
                    self.activityIndicatorView.stopAnimating()
                }
            }
        }
        viewmModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
    // MARK : Actions
}

