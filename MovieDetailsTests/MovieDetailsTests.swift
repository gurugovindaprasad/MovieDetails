//
//  MovieDetailsTests.swift
//  MovieDetailsTests
//
//  Created by Guru Ranganathan on 9/18/20.
//  Copyright © 2020 Guru. All rights reserved.
//

import XCTest
@testable import MovieDetails



class MovieDetailsTests: XCTestCase {
    
    private var app: XCUIApplication!
    
     override func setUp() {
       super.setUp()
       
     }

    

    func testBaseURLString() {
        
        let baseString = "https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/top-rated-indian-movies-01.json"
        let networkClient = NetworkClient()
        
        
        XCTAssert(networkClient.baseURLString == baseString, "Base URL String is wrong.")
    }
    
     
    // To test if there is a detail view controller is present in Story Board
    
    func testMovieDetailControllerHasTableView() {
      
      guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "movieDetail") as? MovieDetailViewController else {
            return XCTFail("Could not instantiate ViewController from main storyboard")
        }

        controller.loadViewIfNeeded()
          
        XCTAssertNotNil(controller.tableView,
                        "Controller should have a tableview")
          
      }
    
    
    
    
    
    
    
    
  
    
    
    

 

}
