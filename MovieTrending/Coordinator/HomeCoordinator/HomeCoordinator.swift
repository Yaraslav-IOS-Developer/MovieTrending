//
//  HomeCoordinator.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import UIKit


final class HomeCoordinator: CoordinatorProtocol {
  var navigation: NavigationProtocol
  private let factory: HomeFactoryProtocol

  init(navigation: NavigationProtocol, factory: HomeFactoryProtocol) {
    self.navigation = navigation
    self.factory = factory
  }

  func start() {
    let homeViewController = factory.makeHomeViewController()
    factory.makeTabBarItem(navigation: navigation)
    navigation.navigationBar.prefersLargeTitles = true
    navigation.pushViewController(homeViewController, animated: true)
  }
}
