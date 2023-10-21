//
//  APICaller.swift
//  MVVM Movie
//
//  Created by Kerem Demir on 16.10.2023.

import Foundation
import UIKit

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMovieModel, NetworkError>) -> Void ) {
        let urlString = NetworkConstant.shared.serverAdress +
                        "trending/movie/day?api_key=" +
                        NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("Error : \(String(describing: error?.localizedDescription))")
            if error == nil,
               let data = data,
               let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                print(resultData)
                completionHandler(.success(resultData))
            } else {
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
