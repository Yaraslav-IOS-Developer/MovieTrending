//
//  ItemTabBar.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import UIKit

enum ItemTabBar {
  case home
  case comingSoon
  case search
  case download

  var title: String {
    switch self {
      case .home:
        return "Home"
      case .comingSoon:
        return "Coming Soon"
      case .search:
        return "Search"
      case .download:
        return "Download"
    }
  }

  var image: String {
    switch self {
      case .home:
        return "house"
      case .comingSoon:
        return "play.circle"
      case .search:
        return "magnifyingglass"
      case .download:
        return "arrow.down.to.line"
    }
  }

  var imageSelected: String {
    switch self {
      case .home:
        return "house.fill"
      case .comingSoon:
        return "play.circle.fill"
      case .search:
        return "magnifyingglass.fill"
      case .download:
        return "arrow.down.to.line.fill"
    }
  }
}
