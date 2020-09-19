//
//  MovieDetailViewController.swift
//  MovieDetails
//
//  Created by Guru Ranganathan on 9/18/20.
//  Copyright © 2020 Guru. All rights reserved.
//

import UIKit

class MovieDetailViewController: UITableViewController {
    
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Movie Detail"
        setupDetailView(movie: movie)
        
    }
    
    func setupDetailView(movie: Movie?) {
        
        guard let movie = movie else { return }
        titleLabel.text =  "\(movie.title) (\(movie.year))"
        
        // using sdwebimagecache - An asynchronous image downloader
        posterImageView.sd_setImage(with: URL(string: movie.posterurl), placeholderImage: UIImage(named: "default"))
        
        genreLabel.text = "Genre: \(movie.genres.compactMap{$0}.joined(separator: ", "))"
        
        imdbLabel.text = "IMDb: \(movie.imdbRating)"

        actorsLabel.text = "Actors: \(movie.actors.compactMap{$0}.joined(separator: ", "))"
        
        descriptionLabel.text = movie.storyline
       
    }
    
    //MARK: TableView AutoSizing of cells
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
      }
    
    //MARK: Denitializing the view
    
    deinit {
        print("View is deninitialized")
    }
    
}
