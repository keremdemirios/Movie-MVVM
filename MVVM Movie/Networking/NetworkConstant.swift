//
//  NetworkConstant.swift
//  MVVM Movie
//
//  Created by Kerem Demir on 16.10.2023.
//

import Foundation
import UIKit

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        // singletone
    }
    
    public var apiKey: String {
        get {
            // API KEY
            return "9d4e2bb4b5c9913f7dfecec00f852fc2"
        }
    }
    
    public var serverAdress: String {
        get {
            return "https://api.themoviedb.org/3"
        }
    }
    
    public var imageServerAdress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}