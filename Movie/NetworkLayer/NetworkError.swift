//
//  WebError.swift
//  Movie
//
//  Created by Palanichamy Padmanabhan on 20/12/18.
//  Copyright © 2018 Palanichamy Padmanabhan. All rights reserved.
//

import Foundation

public enum NetworkError<CustomError>: Error {
    case noInternetConnection
    case custom(CustomError)
    case unauthorized
    case other
}
