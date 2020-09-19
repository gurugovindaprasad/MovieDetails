//
//  MovieCell.swift
//  MovieDetails
//
//  Created by Guru Ranganathan on 9/18/20.
//  Copyright © 2020 Guru. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    
     func configure(with movie: Movie) {
        
        titleLabel.text =  movie.title
            
        // using sdwebimagecache - An asynchronous image downloader
        posterImage.sd_setImage(with: URL(string: movie.posterurl), placeholderImage: UIImage(named: "default"))
    }


}
