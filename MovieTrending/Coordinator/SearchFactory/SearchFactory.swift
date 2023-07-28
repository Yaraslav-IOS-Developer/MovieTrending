//
//  SearchFactory.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import UIKit


protocol SearchFactoryPortocol {
  func makeTabBarItem(navigation: NavigationProtocol)
  func makeSearchFactoryViewController() -> UIViewController
}

struct SearchFactoryImp: SearchFactoryPortocol {
  func makeTabBarItem(navigation: NavigationProtocol) {
    makeItemTabBar(
      navigation: navigation,
      title: ItemTabBar.search.title,
      image: ItemTabBar.search.image,
      selectedImage:ItemTabBar.search.imageSelected
    )
  }

  func makeSearchFactoryViewController() -> UIViewController {
    let searchViewController = SearchViewController()
    searchViewController.title = ItemTabBar.search.title
    return searchViewController
  }
}

extension SearchFactoryImp: ItemTabBarFactory {}
