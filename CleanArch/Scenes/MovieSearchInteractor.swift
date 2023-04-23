//
//  MovieSearchInteractor.swift
//  CleanArch
//
//  Created by Anjali Prasad on 19/04/2023.


import Foundation


actor MovieSearchInteractor {
    
    let output: any MovieSearchInteractableOutput
    let categoryWorker: any MovieCategoryWorkable
    let listWorker: any MovieListWorkable

    
    init(output: any MovieSearchInteractableOutput,
         categoryWorker: any MovieCategoryWorkable,
         listWorker: any MovieListWorkable) {
        self.output = output
        self.categoryWorker = categoryWorker
        self.listWorker = listWorker
    }
}

extension MovieSearchInteractor: MovieSearchInteractableInput{
    
    nonisolated func load(category request: MovieLogic.Category.Request) async {
        
        do {
            let movieCategory =  try await self.categoryWorker.getMovieCategories()
            let response = MovieLogic.Category.Response(movieCategory: movieCategory)
            await self.output.present(category: response)
        } catch {
            
        }
        

    }
    
    nonisolated func load(list request: MovieLogic.Lists.Request) async {
        do {
            let movieList = try await self.listWorker.getMovieList(for: request.genre,
                                                             request.language,
                                                             request.period)
            let response = MovieLogic.Lists.Response(movieList: movieList)
            await self.output.present(list: response)
        } catch {
            
        }

    }
}
