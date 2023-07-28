//
//  ItemTabBarFactory.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import UIKit


protocol ItemTabBarFactory { }

extension ItemTabBarFactory {
  func makeItemTabBar(
    navigation: NavigationProtocol,
    title: String,
    image: String,
    selectedImage: String
  ) {
    let tabBarItem = UITabBarItem(
      title: title,
      image: UIImage(systemName: image),
      selectedImage: UIImage(systemName: selectedImage))

    navigation.rootViewController.tabBarItem = tabBarItem
  }
}
