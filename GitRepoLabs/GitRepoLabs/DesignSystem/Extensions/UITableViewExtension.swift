//
//  UITableViewExtension.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UITableView {
    func register<T: UITableViewCell>(cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    func registerHeader<T: UITableViewHeaderFooterView>(cellClass: T.Type) {
        register(cellClass, forHeaderFooterViewReuseIdentifier: String(describing: cellClass))
    }
    
    func dequeue<T: UITableViewCell>(cellClass: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(
            withIdentifier: cellClass.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                "Error: cell with id: \(cellClass.reuseIdentifier) for indexPath: \(indexPath) is not \(T.self)")
        }
        return cell
    }
    
    func dequeueHeader<T: UITableViewHeaderFooterView>(viewClass: T.Type) -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: String(describing: viewClass)) as? T else {
            fatalError("Error: view with id: \(String(describing: viewClass)) is not \(T.self)")
        }
        return view
    }
}
