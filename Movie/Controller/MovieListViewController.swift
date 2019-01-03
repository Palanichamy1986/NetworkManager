//
//  MovieListViewController.swift
//  Movie
//
//  Created by Palanichamy Padmanabhan on 19/12/18.
//  Copyright © 2018 Palanichamy Padmanabhan. All rights reserved.
//

import UIKit
import SDWebImage

class MovieListViewController: UIViewController {
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    static let sharedApiClient  = NetworkManager.init(baseUrl: Constants.BASE_SERVER_URL)
    var moviesTask: URLSessionDataTask!
    var movies: [Movies] = [] {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        listTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.loadMovies()
    }
    
    func loadMovies() {
        activityIndicator.startAnimating()
        print(MoviesResponse.self)
        let movieResource = Resource<MoviesResponse, CustomError>(jsonDecoder: JSONDecoder(), path: "/18buhu")
        moviesTask = MovieListViewController.sharedApiClient.load(resource: movieResource) {[weak self] response in
            guard let controller = self else { return }
            DispatchQueue.main.async {
                controller.activityIndicator.stopAnimating()
                if let movies = response.value?.movies {
                    self!.lblMessage.isHidden = true
                    self?.listTableView.isHidden = false
                    controller.movies  = movies
                } else if let error = response.error {
                    self!.lblMessage.isHidden = false
                    self?.listTableView.isHidden = true
                    controller.handleError(error)
                }
            }
        }
    }
    
    private func showErrorAlert(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
   
    private func handleError(_ error: NetworkError<CustomError>) {
        switch error {
        case .noInternetConnection:
            showErrorAlert(with: "The internet connection is lost")
        case .unauthorized:
            print("unauthorized")
        case .other:
            showErrorAlert(with: "Unfortunately something went wrong")
        case .custom(let error):
            showErrorAlert(with: error.message)
        }
    }
}


extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    fileprivate func loadImage(_ movie: Movies, _ cell: MovieListTableViewCell) {
        if let strImage = movie.Poster {
            if let url = URL(string: strImage.replacingOccurrences(of: " ", with: "")) {
                cell.listImgView.sd_setImage(with: url, placeholderImage: UIImage(named: "No_Image_Available"))
            }
            else {
                cell.listImgView.image = UIImage.init(named: "No_Image_Available")
            }
        }
        else if let strImage = movie.Poster1 {
            if let url = URL(string: strImage.replacingOccurrences(of: " ", with: ""))
            {
                cell.listImgView.sd_setImage(with: url, placeholderImage: UIImage(named: "No_Image_Available"))
            }
            else {
                cell.listImgView.image = UIImage.init(named: "No_Image_Available")
            }
        }
        else {
            cell.listImgView.image = UIImage.init(named: "No_Image_Available")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieListTableViewCell
        let movie = movies[indexPath.row]
        cell.lblTitle.text = movie.Title
        loadImage(movie, cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        detailViewController.movie = movies[indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}




