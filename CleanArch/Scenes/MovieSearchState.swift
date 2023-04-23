//
//  MovieCategoryState.swift
//  CleanArch
//
//  Created by Anjali Prasad on 21/04/2023.
//

import Foundation

protocol State: Equatable, Sendable {
    var isLoading: Bool { get set}
}

struct MovieCategoryState: State {
    var isLoading: Bool = false
}
