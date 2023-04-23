//
//  MovieSearchWorker.swift
//  CleanArch
//
//  Created by Anjali Prasad on 19/04/2023.


import UIKit

protocol MovieCategoryWorkable {
    func getMovieCategories() async throws -> any MovieCategoryProtocol
}

struct MovieCategoryWorker: MovieCategoryWorkable
{

    func getMovieCategories() async throws -> any MovieCategoryProtocol {
        Bundle.main.decode(MovieCategory.self, from: "category")
    }
    
}
