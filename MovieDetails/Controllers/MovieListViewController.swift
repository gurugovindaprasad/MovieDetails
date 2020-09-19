//
//  ViewController.swift
//  MovieDetails
//
//  Created by Guru Ranganathan on 9/18/20.
//  Copyright © 2020 Guru. All rights reserved.
//

import UIKit
import SDWebImage

class MovieListViewController: UITableViewController {
    
    private var networkClient = NetworkClient()
    
    var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Indian Movies"
        getMovies()
    }
    
    func getMovies() {
        
        networkClient.requestMovies { [weak self] result in
            
            switch result {
                
            case .success(let movies):
                self?.movies = movies
            case .failure(let error):
                DispatchQueue.main.async {
                     self?.showAlert(message: error.rawValue)
                }
            }
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func showAlert(message: String) {
        
        let ac = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    
    //MARK: UITableView DataSource and Delegates
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movie", for: indexPath) as! MovieCell
        
        let movie = movies[indexPath.row]
        
        cell.configure(with: movie)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "movieDetail") as?  MovieDetailViewController else { return }
        
        let movie = movies[indexPath.row]
        vc.movie = movie
        
        navigationController?.pushViewController(vc, animated: true)
    }

}
