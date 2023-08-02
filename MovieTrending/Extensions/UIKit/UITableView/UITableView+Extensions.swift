//
//  UITableView+Extensions.swift
//  MovieTrending
//
//  Created by Yaroslav on 2.08.23.
//

import UIKit


extension UITableView {
  func registerNibCell<CellType: UITableViewCell>(ofType type: CellType.Type) {
    let nibName = String(describing: type)
    let nib = UINib(nibName: nibName, bundle: nil)
    register(nib, forCellReuseIdentifier: nibName)
  }

  func dequeueReusableNibCell<CellType: UITableViewCell>(of type: CellType.Type, forIndexPath indexPath: IndexPath) -> UITableViewCell {
    let identifier = String(describing: type)
    return dequeueReusableCell(withIdentifier: identifier, for: indexPath)
  }
}
