//
//  Route.swift
//  MovieTrending
//
//  Created by Yaroslav on 7.08.23.
//

import Foundation


enum Route {
  static let baseUrl = "https://api.themoviedb.org"

  case trendingMoves
  case trendingTV
  case popular
  case upcomingMoves
  case topRated

  var description: String {
    switch self {
      case .trendingMoves:
        return "/3/trending/movie/day?language=en-US"

      case .trendingTV:
        return "/3/trending/tv/day?language=en-US"

      case .popular:
        return "/3/movie/popular?language=en-US&page=1"

      case .upcomingMoves:
        return "/3/movie/upcoming?language=en-US&page=1"
        
      case .topRated:
        return "/3/movie/top_rated?language=en-US&page=1"
    }
  }
}
