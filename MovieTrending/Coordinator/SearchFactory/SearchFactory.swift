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
    let searchView = SearchView()
    let searchResultView = SearchResultView()
    let resultSearchViewController = UISearchController(searchResultsController: SearchResultViewController(searchResultView: searchResultView))
    let searchViewController = SearchViewController(searchView: searchView, searchViewController: resultSearchViewController)
    searchViewController.title = ItemTabBar.search.title
    return searchViewController
  }
}

extension SearchFactoryImp: ItemTabBarFactory {}
