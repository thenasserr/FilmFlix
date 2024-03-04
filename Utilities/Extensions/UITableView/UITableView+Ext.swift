//
//  UITableView+Ext.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 05/03/2024.
//

import UIKit


extension UITableView: Identifiable { }

extension UITableView {
    func registerNib<Cell: UITableViewCell>(_ cell: Cell.Type) where Cell: Identifiable {
        self.register(UINib(nibName: Cell.identifier, bundle: nil), forCellReuseIdentifier: Cell.identifier)
    }
    
    func dequeue<Cell: UITableViewCell>(indexPath: IndexPath) -> Cell? where Cell: Identifiable {
        return self.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as? Cell
    }
}
