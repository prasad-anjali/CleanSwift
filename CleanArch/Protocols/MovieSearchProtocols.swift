//
//  MovieSearchProtocols.swift
//  CleanArch
//
//  Created by Anjali Prasad on 20/04/2023.
//

import Foundation

typealias MovieSearchInteractableInput = MovieSearchViewableOutput
typealias MovieSearchPresentableInput = MovieSearchInteractableOutput
typealias MovieSearchViewableInput = MovieSearchPresentableOutput

typealias MovieSearchInteractableOutput = MovieSearchPresentable
typealias MovieSearchPresentableOutput = MovieSearchViewable
typealias MovieSearchViewableOutput = MovieSearchInteractable

protocol MovieSearchViewable: AnyObject
{
    func show(category viewModel: MovieLogic.Category.ViewModel) async
    func show(list viewModel: MovieLogic.Lists.ViewModel) async
    
}

protocol MovieSearchInteractable: AnyObject
{
    func load(category request: MovieLogic.Category.Request) async
    func load(list request: MovieLogic.Lists.Request) async
}

protocol MovieSearchPresentable
{
    func present(category response: MovieLogic.Category.Response) async
    func present(list response: MovieLogic.Lists.Response) async
}
