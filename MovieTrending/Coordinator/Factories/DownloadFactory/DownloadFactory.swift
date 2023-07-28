//
//  DownloadFactory.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import UIKit


protocol DownloadFactoryProtocol {
  func makeTabBarItem(navigation: NavigationProtocol)
  func makeDownloadViewController() -> UIViewController
}

struct DownloadFactoryImp: DownloadFactoryProtocol {
  func makeTabBarItem(navigation: NavigationProtocol) {
    makeItemTabBar(
      navigation: navigation,
      title: ItemTabBar.download.title,
      image: ItemTabBar.download.image,
      selectedImage: ItemTabBar.download.imageSelected
    )
  }

  func makeDownloadViewController() -> UIViewController {
    let downloadViewController = DownloadViewController()
    downloadViewController.title = ItemTabBar.download.title
    return downloadViewController
  }

}

extension DownloadFactoryImp: ItemTabBarFactory {}
