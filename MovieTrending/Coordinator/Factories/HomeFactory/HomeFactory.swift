//
//  HomeFactory.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import UIKit


protocol HomeFactoryProtocol {
  func makeTabBarItem(navigation: NavigationProtocol)
  func makeHomeViewController() -> UIViewController
}

struct HomeFactoryImp: HomeFactoryProtocol {
  func makeHomeViewController() -> UIViewController {
    let homeViewController = HomeViewController()
    homeViewController.title = ItemTabBar.home.title
    return homeViewController
  }

  func makeTabBarItem(navigation: NavigationProtocol) {
    makeItemTabBar(
      navigation: navigation,
      title: ItemTabBar.home.title,
      image: ItemTabBar.home.image,
      selectedImage: ItemTabBar.home.imageSelected
    )
  }
}

extension HomeFactoryImp: ItemTabBarFactory { }
