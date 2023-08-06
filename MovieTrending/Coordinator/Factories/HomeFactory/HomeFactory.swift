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
    let view = HomeView()
    let headerView = HeroHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
    let homeViewController = HomeViewController(homeView: view, headerView: headerView)
    homeViewController.navigationController?.setNavigationBarHidden(true, animated: true)
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
