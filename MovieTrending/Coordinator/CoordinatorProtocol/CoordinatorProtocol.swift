//
//  CoordinatorProtocol.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import Foundation


protocol CoordinatorProtocol: AnyObject {
  var navigation: NavigationProtocol { get set }
  func start()
}
