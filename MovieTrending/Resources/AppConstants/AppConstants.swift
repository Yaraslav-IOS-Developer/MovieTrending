//
//  AppConstants.swift
//  MovieTrending
//
//  Created by Yaroslav on 4.08.23.
//

import Foundation


enum AppConstants {
  enum Keys {
    static let API = "13152e0664ad4a29df9c3a3198ac45f3"
  }

  enum BaseUrl {
    static let movies = URL(string: "https://api.themoviedb.org")!
  }

  enum EndPoints {
   static let webPlants = URL(string: "https://api.whatplantisthis.io")!
  }
}
