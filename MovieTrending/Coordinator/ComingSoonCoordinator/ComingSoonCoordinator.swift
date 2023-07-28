//
//  ComingSoonCoordinator.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import UIKit


final class ComingSoonCoordinator: CoordinatorProtocol {
  var navigation: NavigationProtocol
  private let factory: ComingSoonFactoryProtocol

  init(navigation: NavigationProtocol, factory: ComingSoonFactoryProtocol) {
    self.navigation = navigation
    self.factory = factory
  }

  func start() {
    let comingSoonViewController = factory.makeComingSoonViewController()
    factory.makeTabBarItem(navigation: navigation)
    navigation.navigationBar.prefersLargeTitles = true
    navigation.pushViewController(comingSoonViewController, animated: true)
  }
}
