//
//  MovieListWorker.swift
//  CleanArch
//
//  Created by Anjali Prasad on 20/04/2023.
//

import Foundation

protocol MovieListWorkable {
    func getMovieList(for genre: String, _ language: String, _ period: String) async throws-> any MovieListProtocol
}

struct MovieListWorker: MovieListWorkable {
    
    func getMovieList(for genre: String, _ language: String, _ period: String) async throws -> any MovieListProtocol {
        Bundle.main.decode(MovieList.self, from: "movies")
    }
}
