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
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Movie Detail"
        setupDetailView()
        
    }
    
    func setupDetailView() {
        
        guard let movie = movie else { return }
        titleLabel.text =  movie.title
        
        // using sdwebimagecache - An asynchronous image downloader
        posterImageView.sd_setImage(with: URL(string: movie.posterurl), placeholderImage: UIImage(named: "default"))
        yearLabel.text = movie.year
        descriptionLabel.text = movie.storyline
    }
    
    //MARK: TableView AutoSizing of cells
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
      }
    
}
