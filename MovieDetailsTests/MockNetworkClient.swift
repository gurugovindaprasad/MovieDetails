//
//  MockNetworkClient.swift
//  MovieDetailsTests
//
//  Created by Guru Ranganathan on 9/19/20.
//  Copyright © 2020 Guru. All rights reserved.
//

import Foundation
@testable import MovieDetails

class MockNetworkClient:NetworkSession  {
    
    var shouldMockSuccessCondition = true
    
    var movie = [Movie]()
    
    
    
    init(isSuccessMock: Bool) {
        self.shouldMockSuccessCondition = isSuccessMock
        self.movie.append(Movie(title: "test", year: "test", genres: ["a","b"], storyline: "test", actors: ["test", "test"], imdbRating: 4.0, posterurl: "imageurl"))
    }
    
    func requestMovies(completion: @escaping ((Result<[Movie], NetworkError>) -> Void))  {
        
        if self.shouldMockSuccessCondition {
            completion(.success(self.movie))
        } else {
            completion(.failure(.badURL))
        }
    }
    

}
