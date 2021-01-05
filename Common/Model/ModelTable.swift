//
//  ModelTable.swift
//  apiAPI
//
//  Created by Азат Киракосян on 21.11.2020.
//

import Foundation
import UIKit

struct MyTableViewCellModel {

    let starImage: UIImage
    let avatarImageURL: URL?
    let descreptionMovie: String?
    let titleMovie: String?
    let rateMovie: String?
    let relisMovie: String?
    let movie: Movie
    
   
    init(movie: Movie) {
        self.movie = movie
        
        titleMovie = movie.title
        descreptionMovie = movie.overview
        relisMovie = movie.releaseDate
        starImage = #imageLiteral(resourceName: "star")
       
        
        if let rateMovie = movie.vote_average {
            self.rateMovie = "\(rateMovie)"
        } else {
            self.rateMovie = nil
        }

        if let posterString = movie.poster_path {
            avatarImageURL = URL(string: "https://image.tmdb.org/t/p/w300" + posterString)
        } else {
            avatarImageURL = nil
        }
        
        
        
    }
}
