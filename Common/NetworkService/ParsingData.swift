//
//  NetworkData.swift
//  apiAPI
//
//  Created by Азат Киракосян on 21.11.2020.
//

import Foundation

struct NetworkData: Decodable {

    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
        
    }
}

// MARK: - Info

struct Movie: Decodable {
    
    let title: String?
    let poster_path: String?
    let overview: String?
    let vote_average: Double?
    let releaseDate: String?
    
    
    private enum CodingKeys: String, CodingKey {
        case title
        case poster_path
        case overview
        case vote_average
        case releaseDate = "release_date"
        
        
    }
}
