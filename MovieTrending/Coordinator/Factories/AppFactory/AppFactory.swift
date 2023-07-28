//
//  AppFactoryProtocol.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import Foundation


protocol AppFactoryProtocol {
  func makeMainTabBarCoordinator(navigation: NavigationProtocol) -> CoordinatorProtocol
}

struct AppFactory: AppFactoryProtocol {
  func makeMainTabBarCoordinator(navigation: NavigationProtocol) -> CoordinatorProtocol {
    let factory = MainTabBarFactory()
    let coordinator = MainTabBarCoordinator(navigation: navigation, factory: factory)

    return coordinator
  }
}
