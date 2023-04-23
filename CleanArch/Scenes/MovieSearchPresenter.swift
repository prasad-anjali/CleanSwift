//
//  GetMoviePresenter.swift
//  CleanArch
//
//  Created by Anjali Prasad on 19/04/2023.

import UIKit



class MovieSearchPresenter {
    
    weak var output: MovieSearchPresentableOutput?
}

extension MovieSearchPresenter: MovieSearchPresentableInput {
    
    func present(category response: MovieLogic.Category.Response) async{
        
        let viewModel = MovieLogic.Category.ViewModel(genre: response.movieCategory.genre,
                                                      language: response.movieCategory.language,
                                                      period: response.movieCategory.period)
        await output?.show(category: viewModel)
        
    }
    
    func present(list response: MovieLogic.Lists.Response) async {
        let viewModel = MovieLogic.Lists.ViewModel(title: response.movieList.title,
                                                   director: response.movieList.director)
        await output?.show(list: viewModel)
    }
}
