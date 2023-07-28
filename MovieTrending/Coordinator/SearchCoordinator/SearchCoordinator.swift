//
//  SearchCoordinator.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import UIKit


final class SearchCoordinator: CoordinatorProtocol {
  var navigation: NavigationProtocol
  var factory: SearchFactoryPortocol

  init(navigation: NavigationProtocol, factory: SearchFactoryPortocol) {
    self.navigation = navigation
    self.factory = factory
  }

  func start() {
    let searchViewController = factory.makeSearchFactoryViewController()
    factory.makeTabBarItem(navigation: navigation)
    navigation.navigationBar.prefersLargeTitles = true
    navigation.pushViewController(searchViewController, animated: true)
  }
}
