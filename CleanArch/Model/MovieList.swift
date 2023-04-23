//
//  MovieList.swift
//  CleanArch
//
//  Created by Anjali Prasad on 20/04/2023.
//

import Foundation

protocol MovieListProtocol: Codable, Equatable {
    var title: String { get }
    var director: String { get }
}

struct MovieList: MovieListProtocol {
    var title: String
    var director: String    
}
