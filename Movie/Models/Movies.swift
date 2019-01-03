//
//  Movies.swift
//  Movie
//
//  Created by Palanichamy Padmanabhan on 20/12/18.
//  Copyright © 2018 Palanichamy Padmanabhan. All rights reserved.
//

import Foundation

struct Movies: Decodable {
    var Title: String?
    var Year: String?
    var Rated: String?
    var Released: String?
    var Runtime: String?
    var Genre: String?
    var Director: String?
    var Writer: String?
    var Actors: String?
    var Plot: String?
    var Language: String?
    var Country: String?
    var Awards: String?
    var Poster : String?
    var Poster1 : String?
    var BoxOffice: String?
    var Response: String?
    var Ratings: String?
    var Metascore: String?
    var imdbRating: String?
    var imdbVotes: String?
    var imdbID: String?
    var DVD: String?
    var Website: String?
    var MovieType: String?
    var Production: String?
    enum CodingKeys: String, CodingKey {
        case Poster = "Poster "
        case Poster1 = "Poster"
        case MovieType = "Type "
        case Title, Year, Rated, Released, Runtime, Genre, Director, Writer, Actors, Plot, Language, Country, Awards, BoxOffice, Response
    }
}

struct MoviesResponse: Decodable {
    var movies : [Movies]
}
