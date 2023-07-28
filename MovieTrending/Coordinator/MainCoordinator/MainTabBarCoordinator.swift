//
//  MainTabBarCoordinator.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import UIKit


final class MainTabBarCoordinator: CoordinatorProtocol {
  var navigation: NavigationProtocol
  private var childCoordinators: [CoordinatorProtocol] = []
  private let factory: MainTabBarFactoryProtocol

  init(navigation: NavigationProtocol, factory: MainTabBarFactoryProtocol) {
    self.navigation = navigation
    self.factory = factory
  }

  func start() {
    let navigationTabBar = factory.makeMainTabBarController()
    navigation.pushViewController(navigationTabBar, animated: false)
    navigation.navigationBar.isHidden = true

    childCoordinators = factory.makeChildCoordinators()
    let childNavigation = childCoordinators.map { $0.navigation.rootViewController }
    childCoordinators.forEach { $0.start() }
    navigationTabBar.viewControllers = childNavigation
  }
}
