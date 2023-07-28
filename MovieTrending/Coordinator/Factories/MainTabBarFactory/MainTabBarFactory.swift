//
//  MainTabBarFactory.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import UIKit


protocol MainTabBarFactoryProtocol {
  func makeMainTabBarController() -> UITabBarController
  func makeChildCoordinators() -> [CoordinatorProtocol]
}

struct MainTabBarFactory: MainTabBarFactoryProtocol {
  func makeMainTabBarController() -> UITabBarController {
    let mainTabBarController = MainTabBarViewController()
    return mainTabBarController
  }

  func makeChildCoordinators() -> [CoordinatorProtocol] {
    let homeCoordinator = makeHomeCoordinator()
    let comingSoonCoordinator = makeComingSoonCoordinator()
    let topSearchCoordinator = makeTopSearchCoordinator()
    let downloadsCoordinator = makeDownloadsCoordinator()

    return [
      homeCoordinator,
      comingSoonCoordinator,
      topSearchCoordinator,
      downloadsCoordinator
    ]
  }

  private func makeHomeCoordinator() -> CoordinatorProtocol {
    let navigation = NavigationImp(rootViewController: UINavigationController())
    let factory = HomeFactoryImp()
    let coordinator = HomeCoordinator(navigation: navigation, factory: factory)
    return coordinator
  }

  private func makeComingSoonCoordinator() -> CoordinatorProtocol {
    let navigation = NavigationImp(rootViewController: UINavigationController())
    let factory = ComingSoonFactoryImp()
    let coordinator = ComingSoonCoordinator(navigation: navigation, factory: factory)
    return coordinator
  }

  private func makeTopSearchCoordinator() -> CoordinatorProtocol {
    let navigation = NavigationImp(rootViewController: UINavigationController())
    let factory = SearchFactoryImp()
    let coordinator = SearchCoordinator(navigation: navigation, factory: factory)
    return coordinator
  }

  private func makeDownloadsCoordinator() -> CoordinatorProtocol {
    let navigation = NavigationImp(rootViewController: UINavigationController())
    let factory = DownloadFactoryImp()
    let coordinator = DownloadCoordinator(navigation: navigation, factory: factory)
    return coordinator
  }
}
