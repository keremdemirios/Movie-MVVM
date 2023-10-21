//
//  APICaller.swift
//  MVVM Movie
//
//  Created by Kerem Demir on 16.10.2023.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

class APICaller {
    
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMoviesModel, NetworkError>) -> Void ) {
        
        let urlString = NetworkConstant.shared.serverAdress + "trending/all/day?api=key" + NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            if error == nil,
                let data = data,
                let resultJson = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data) {
                    completionHandler(.success(resultJson))
            } else {
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
