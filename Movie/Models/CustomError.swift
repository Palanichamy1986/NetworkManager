//
//  CustomError.swift
//  Movie
//
//  Created by Palanichamy Padmanabhan on 20/12/18.
//  Copyright © 2018 Palanichamy Padmanabhan. All rights reserved.
//

import Foundation

struct CustomError: Error, Decodable {
    var message: String
}
