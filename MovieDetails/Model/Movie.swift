//
//  MovieList.swift
//  MovieDetails
//
//  Created by Guru Ranganathan on 9/18/20.
//  Copyright © 2020 Guru. All rights reserved.
//

import Foundation

struct Movie: Codable {
    
    var title: String
    var year: String
    var genres: [String]
    var storyline: String
    var actors: [String]
    var imdbRating: Double
    var posterurl: String

    
    
    
}
