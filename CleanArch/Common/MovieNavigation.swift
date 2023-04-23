//
//  MovieNavigation.swift
//  CleanArch
//
//  Created by Anjali Prasad on 22/04/2023.
//

import Foundation
import UIKit

class MovieNavigation: UINavigationController {
    
    var assemblies: [Scene: Assembly] = [:]
    
    required init() {
        super.init(nibName: nil, bundle: nil)
        assemblies[.search] = MovieSearchAssembly()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewController(for scene: Scene) async {
        guard let assembly = assemblies[scene] else { fatalError() }
        let controller = await assembly.build()
        setViewControllers([controller], animated: false)
    }
}
