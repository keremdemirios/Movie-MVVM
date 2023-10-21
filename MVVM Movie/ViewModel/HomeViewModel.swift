//
//  MainViewModel.swift
//  MVVM Movie
//
//  Created by Kerem Demir on 16.10.2023.
//

import Foundation
import UIKit

class HomeViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[Movie]> = Observable(nil)
    var dataSource: TrendingMovieModel?
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.results?.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        
        isLoading.value = true
        
        APICaller.getTrendingMovies { [ self ] result in
            isLoading.value = false
            switch result {
            case .success(let data):
                print("Top trending count : \(data.results!.count)")
                dataSource = data
                mapCellData()
            case .failure(let error):
                print("Error : \(error)")
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results ?? []
    }
    
    func getMovieName(_ movie: Movie) -> String {
        return movie.title ?? ""
    }
}
