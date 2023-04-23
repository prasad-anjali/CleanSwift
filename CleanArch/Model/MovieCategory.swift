//
//  Movie.swift
//  CleanArch
//
//  Created by Anjali Prasad on 19/04/2023.
//

import Foundation

protocol MovieCategoryProtocol: Codable, Equatable {
    var genre: [String] { get }
    var language: [String] { get }
    var period: [String] { get }
}

struct MovieCategory: MovieCategoryProtocol {
    var genre: [String]
    var language: [String]
    var period: [String]
    
}

