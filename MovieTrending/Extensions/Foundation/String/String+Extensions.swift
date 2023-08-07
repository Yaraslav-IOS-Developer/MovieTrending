//
//  String+Extensions.swift
//  MovieTrending
//
//  Created by Yaroslav on 6.08.23.
//

import Foundation


extension String {
  func capitalizedFirst() -> String {
    guard let firstChar = first else {
      return self
    }
    return String(firstChar).uppercased() + dropFirst()
  }
}

extension String {
  var asUrl: URL? {
    return URL(string: self)
  }
}
