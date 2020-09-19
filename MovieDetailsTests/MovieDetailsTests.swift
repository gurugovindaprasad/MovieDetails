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
    
    func testBaseURLString() {
        
        let baseString = "https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/top-rated-indian-movies-01.json"
        let networkClient = NetworkClient()
        
        
        XCTAssert(networkClient.baseURLString == baseString, "Base URL String is wrong.")
    }
    
     
    // To test if there is a detail view controller is present in StoryBoard
    
    func testMovieDetailControllerHasTableView() {
      
      guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "movieDetail") as? MovieDetailViewController else {
            return XCTFail("Could not instantiate ViewController from main storyboard")
        }

        controller.loadViewIfNeeded()
          
        XCTAssertNotNil(controller.tableView,
                        "Controller should have a tableview")
          
      }
    
    
    func testMovieJSONResponse() throws {
        let bundle = Bundle(for: type(of: self))
        guard
            let url = bundle.url(forResource: "mock", withExtension: "json")
            else { fatalError("Can't find search.json file") }
        
        let data = try Data(contentsOf: url)
        let response = try JSONDecoder().decode([Movie].self, from: data)
        
        let movie = response.first!
        
        XCTAssertEqual(movie.title, "Anand")
        XCTAssertEqual(movie.year, "1971")
        XCTAssertEqual(movie.imdbRating, 8.9)
        
    }

}
