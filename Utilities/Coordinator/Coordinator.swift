//
//  Coordinator.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

import UIKit

protocol Coordinator {
    var router: Router { get }
    
    func start()
}
