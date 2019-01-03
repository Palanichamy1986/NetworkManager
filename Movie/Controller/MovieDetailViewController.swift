//
//  MovieDetailViewController.swift
//  Movie
//
//  Created by user on 21/12/18.
//  Copyright © 2018 Palanichamy Padmanabhan. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var movie = Movies()
    var dict = [String : Any]()
    var titleArray = [String]()
    var valueArray = [Any]()
    
    @IBOutlet weak var topImgView: UIImageView!
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        listTableView.estimatedRowHeight = 44
        self.loadImage()
        self.loadMovieDetails()
    }
    
    fileprivate func loadImage() {
        if let strImage = movie.Poster {
            if let url = URL(string: strImage.replacingOccurrences(of: " ", with: "")) {
                topImgView.sd_setImage(with: url, placeholderImage: UIImage(named: "No_Image_Available"))
            }
            else {
                topImgView.image = UIImage.init(named: "No_Image_Available")
            }
        }
        else if let strImage = movie.Poster1 {
            if let url = URL(string: strImage.replacingOccurrences(of: " ", with: ""))
            {
                topImgView.sd_setImage(with: url, placeholderImage: UIImage(named: "No_Image_Available"))
            }
            else {
                topImgView.image = UIImage.init(named: "No_Image_Available")
            }
        }
        else {
            topImgView.image = UIImage.init(named: "No_Image_Available")
        }
    }
    
    fileprivate func loadMovieDetails() {
        dict =  ["Title" : movie.Title ?? "" , "Plot" : movie.Plot ?? "", "Year" : movie.Year ?? "", "Rated" : movie.Rated ?? "", "Released" : movie.Released ?? "", "Runtime" : movie.Runtime ?? "", "Genre" : movie.Genre ?? "", "Director" : movie.Director ?? "", "Writer": movie.Writer ?? "", "Actors" : movie.Actors ?? "", "Language" : movie.Language ?? "", "Country" : movie.Country ?? "", "Awards" : movie.Awards ?? "", "Ratings" : movie.Ratings ?? "", "Metascore" : movie.Metascore ?? "", "imdbRating" : movie.imdbRating ?? "" , "imdbVotes" : movie.imdbVotes ?? "", "imdbID" : movie.imdbID ?? "", "DVD" : movie.DVD ?? "", "BoxOffice" : movie.BoxOffice ?? "", "Production" : movie.Production ?? "" , "Website" : movie.Website ?? "", "Response" : movie.Response ?? "","Type" : movie.MovieType ?? ""]
        for (key,value) in dict {
            titleArray.append(key)
            valueArray.append(value)
        }
        listTableView.reloadData()
    }
    
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.text = String(format: "%@ - %@", titleArray[indexPath.row],valueArray[indexPath.row] as! CVarArg)
        return cell
    }

}


