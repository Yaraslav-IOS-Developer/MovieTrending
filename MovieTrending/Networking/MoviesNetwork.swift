//
//  MoviesNetwork.swift
//  MovieTrending
//
//  Created by Yaroslav on 10.08.23.
//

import Foundation


final class MoviesNetwork: BaseNetworkService {
  private static var instance = MoviesNetwork()
  public static var shared: MoviesNetwork {
    return instance
  }
  private override init() { }

  func fetchTrendingMovies(completion: @escaping(Result<[Movie], Error>) -> Void) {
    let params = ["api_key": "13152e0664ad4a29df9c3a3198ac45f3"]
    request(route: .trendingMoves, method: .get, parameters: params, completion: completion)
  }

  func fetchTrendingTV(completion: @escaping(Result<[Movie], Error>) -> Void) {
    let params = ["api_key": "13152e0664ad4a29df9c3a3198ac45f3"]
    request(route: .trendingTV, method: .get, parameters: params, completion: completion)
  }

  func fetchPopular(completion: @escaping(Result<[Movie], Error>) -> Void) {
    let params = ["api_key": "13152e0664ad4a29df9c3a3198ac45f3"]
    request(route: .popular, method: .get, parameters: params, completion: completion)
  }

  func fetchUpcomingMoves(completion: @escaping(Result<[Movie], Error>) -> Void) {
    let params = ["api_key": "13152e0664ad4a29df9c3a3198ac45f3"]
    request(route: .upcomingMoves, method: .get, parameters: params, completion: completion)
  }

  func fetchTopRated(completion: @escaping(Result<[Movie], Error>) -> Void) {
    let params = ["api_key": "13152e0664ad4a29df9c3a3198ac45f3"]
    request(route: .topRated, method: .get, parameters: params, completion: completion)
  }
}

