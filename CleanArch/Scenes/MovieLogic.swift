//
//  MovieLogic.swift
//  CleanArch
//
//  Created by Anjali Prasad on 19/04/2023.


import UIKit

enum MovieLogic {
    
    enum Category {
        struct Request {}
        struct Response {
            let movieCategory: any MovieCategoryProtocol
        }
        struct ViewModel {
            let genre: [String]
            let language: [String]
            let period: [String]
        }
    }
    
    enum Lists {
        struct Request {
            let genre: String
            let language: String
            let period: String
        }
        
        struct Response {
            let movieList: any MovieListProtocol
        }
        
        struct ViewModel {
            let title: String
            let director: String
        }
        
    }
}
