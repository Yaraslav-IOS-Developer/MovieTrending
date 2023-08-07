//
//  AppError.swift
//  MovieTrending
//
//  Created by Yaroslav on 7.08.23.
//

import Foundation


enum AppError: LocalizedError {
  case errorDescription
  case unownedError
  case invalidUrl
  case serverError(String)

  var errorDescription: String? {
    switch self {
      case .errorDescription:
        return "Response could not be decoded"
      case .unownedError:
        return "Bruhhh! I have no idea what go on"
      case .invalidUrl:
        return "HEYYY!!! Give me a valid URL"
      case .serverError(let error):
        return error
    }
  }
}
