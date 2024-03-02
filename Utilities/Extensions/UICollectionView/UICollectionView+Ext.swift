//
//  UICollectionView+Ext.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

import UIKit
protocol Identifiable { }

extension Identifiable {
    static var identifier: String { String(describing: Self.self) }
}

extension UICollectionView: Identifiable { }

extension UICollectionView {
    func registerNib<Cell: UICollectionViewCell>(_ cell: Cell.Type) where Cell: Identifiable {
        self.register(UINib(nibName: Cell.identifier, bundle: nil),
                      forCellWithReuseIdentifier: Cell.identifier)
    }
    
    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell? where Cell: Identifiable {
        return self.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as? Cell
    }
}
