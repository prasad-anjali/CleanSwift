//
//  Extensions.swift
//  CleanArch
//
//  Created by Anjali Prasad on 19/04/2023.
//

import Foundation
import UIKit

//MARK: - UIView
extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
}

//MARK: - Bundle

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: "json") else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to load data!")
        }
        
        guard let movieResponse = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Unable to decode data!")
        }
        
        return movieResponse
    }
}

//MARK: - UIViewController

extension UIViewController {
    func configureNavigationAppearance() {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.compactAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        
        navigationItem.title = "Movie"
    }
}
