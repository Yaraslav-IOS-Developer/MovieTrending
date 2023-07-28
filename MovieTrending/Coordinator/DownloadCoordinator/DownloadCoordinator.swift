//
//  DownloadCoordinator.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import UIKit


final class DownloadCoordinator: CoordinatorProtocol {
  var navigation: NavigationProtocol
  var factory: DownloadFactoryProtocol

  init(navigation: NavigationProtocol, factory: DownloadFactoryProtocol) {
    self.navigation = navigation
    self.factory = factory
  }

  func start() {
    let downloadViewController = factory.makeDownloadViewController()
    factory.makeTabBarItem(navigation: navigation)
    navigation.navigationBar.prefersLargeTitles = true
    navigation.pushViewController(downloadViewController, animated: true)
  }
}
