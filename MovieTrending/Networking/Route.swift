//
//  Route.swift
//  MovieTrending
//
//  Created by Yaroslav on 7.08.23.
//

import Foundation


enum Route {
  static let baseUrl = ""

  case trendingMoves
  case trendingTV
  case popular
  case upcomingMoves
  case topRated

  var description: String {
    switch self {
      case .trendingMoves:
        return ""

      case .trendingTV:
        return ""

      case .popular:
        return ""

      case .upcomingMoves:
        return ""
      case .topRated:
        return ""
    }
  }
}
