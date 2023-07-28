//
//  AppCoordinator.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import UIKit


final class AppCoordinator: CoordinatorProtocol {
  var navigation: NavigationProtocol
  var childCoordinators: [CoordinatorProtocol] = []
  private var window: UIWindow?
  private var factory: AppFactoryProtocol?

  init(
    navigation: NavigationProtocol,
    window: UIWindow,
    factory: AppFactoryProtocol?
  ) {
    self.navigation = navigation
    self.window = window
    self.factory = factory
  }

  func start() {
    configureWindow()
    startSomeCoordinator()
  }

  private func configureWindow() {
    window?.rootViewController = navigation.rootViewController
    window?.makeKeyAndVisible()
  }

  private func startSomeCoordinator() {
    startMainTabBarCoordinator()
  }

  private func startMainTabBarCoordinator() {
    let mainTabBarCoordinator = factory?.makeMainTabBarCoordinator(navigation: navigation)
    addChildCoordinator(mainTabBarCoordinator)
  }
}

extension AppCoordinator: ParentCoordinator { }
