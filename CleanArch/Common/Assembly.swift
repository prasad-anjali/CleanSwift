//
//  Assembly.swift
//  CleanArch
//
//  Created by Anjali Prasad on 21/04/2023.
//

import Foundation
import UIKit


protocol Assembly {
    func build() async -> UIViewController
}


enum Scene {
    case search
    case details
}


