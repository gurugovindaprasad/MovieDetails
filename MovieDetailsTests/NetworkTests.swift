//
//  NetworkTests.swift
//  MovieDetailsTests
//
//  Created by Guru Ranganathan on 9/19/20.
//  Copyright © 2020 Guru. All rights reserved.
//

import XCTest
@testable import MovieDetails

class NetworkTests: XCTestCase {


    func testApiFailureCase() {
          
          // Simulating api request failure condition
          let service = MockNetworkClient(isSuccessMock: false)
          
          var isMovieReceived = false
          var receivedMovie: [Movie]?
          var errorMessage = ""
        
        
        service.requestMovies {  result in
        
        switch result {
            
        case .success(let movie):
             isMovieReceived = true
             receivedMovie = movie
         case .failure(let error):
             isMovieReceived = false
             errorMessage = error.rawValue
        }
        }
        
          XCTAssert(isMovieReceived == false)
          XCTAssert(receivedMovie == nil)
          XCTAssertEqual(errorMessage, "Something went wrong. Sorry for the inconvinence.")
          
      }
    
    
    func testApiSuccessCase() {
        
        // Simulate api request success condition
        let service = MockNetworkClient(isSuccessMock: true)
        
         var isMovieReceived = false
         var receivedMovie: [Movie]?
        
          service.requestMovies {  result in
           
           switch result {
           case .success(let movie):
                isMovieReceived = true
                receivedMovie = movie
            case .failure(_):
                isMovieReceived = false
           }
           }
        
        XCTAssert(isMovieReceived == true)
        XCTAssert(receivedMovie != nil)
        
       
    }

}
