//
//  ComingSoonFactory.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import UIKit


protocol ComingSoonFactoryProtocol {
  func makeTabBarItem(navigation: NavigationProtocol)
  func makeComingSoonViewController() -> UIViewController
}

struct ComingSoonFactoryImp: ComingSoonFactoryProtocol {
  func makeTabBarItem(navigation: NavigationProtocol) {
    makeItemTabBar(
      navigation: navigation,
      title: ItemTabBar.comingSoon.title,
      image: ItemTabBar.comingSoon.image,
      selectedImage: ItemTabBar.comingSoon.imageSelected
    )
  }

  func makeComingSoonViewController() -> UIViewController {
    let view = UpcomingView()
    let comingSoonViewController = UpcomingViewController(upcomingView: view)
    comingSoonViewController.title = ItemTabBar.comingSoon.title
    return comingSoonViewController
  }
}

extension ComingSoonFactoryImp: ItemTabBarFactory {}
