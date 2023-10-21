//
//  MainViewModel.swift
//  MVVM Movie
//
//  Created by Kerem Demir on 16.10.2023.
//

import Foundation
import UIKit

class MainViewModel {
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        10
    }
    
    func getData(){
        APICaller.getTrendingMovies { result in
            switch result {
            case .success(let data):
                print("Burda")
                print("Top trending count : \(data.results.count)")
            case .failure(let error):
//                print("Burda hata.")
                print("Error : \(error)")
            }
        }
    }
}
