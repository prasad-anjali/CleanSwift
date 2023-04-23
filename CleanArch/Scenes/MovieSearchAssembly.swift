//
//  MovieSearchAssembly.swift
//  CleanArch
//
//  Created by Anjali Prasad on 21/04/2023.
//

import Foundation
import UIKit

@MainActor
struct MovieSearchAssembly: Assembly {
    
    func build() async -> UIViewController {
        
        let controller =  MovieSearchViewController()
        let presenter = MovieSearchPresenter()
        let categoryWorker = MovieCategoryWorker()
        let listWorker = MovieListWorker()
        
        let interactor = MovieSearchInteractor(output: presenter,
                                               categoryWorker: categoryWorker,
                                               listWorker: listWorker)
        
        controller.output = interactor
        presenter.output = controller
        
        return controller
    }
    
}
