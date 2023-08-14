//
//  BaseNetworkService.swift
//  MovieTrending
//
//  Created by Yaroslav on 5.08.23.
//

import UIKit


class BaseNetworkService {
  func request<T: Codable>(route: Route,
                           method: Method,
                           parameters: [String: Any]? = nil,
                           completion: @escaping(Result<T, Error>) -> Void) {
    guard let request = createRequest(route: route, method: method, parameters: parameters) else {
      completion(.failure(AppError.unownedError))
      return
    }

    URLSession.shared.dataTask(with: request) { data, response, error in
      var result: Result<Data, Error>?
      if let data = data {
        result = .success(data)
        let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify our data"
        print("The response is:\n\(responseString)")
      } else if let error = error {
        result = .failure(error)
        print("The error is: \(error.localizedDescription)")
      }

      DispatchQueue.main.async {
        self.handleResponse(result: result, completion: completion)
      }
    }.resume()
  }

  private func handleResponse<T: Codable>(result: Result<Data, Error>?,
                                          completion: (Result<T, Error>) -> Void) {
    guard let result = result else {
      completion(.failure(AppError.unownedError))
      return
    }

    switch result {
      case .success(let data):
        let decoder = JSONDecoder()
        guard let response = try? decoder.decode(MoviesResponse<T>.self, from: data) else {
          completion(.failure(AppError.errorDescription))
          return
        }

        if let decodedData = response.results {
          completion(.success(decodedData))
        } else {
          completion(.failure(AppError.unownedError))
        }
      case .failure(let error):
        completion(.failure(error))
    }
  }

  private func createRequest(route: Route,
                             method: Method,
                             parameters: [String: Any]? = nil) -> URLRequest? {
    let urlString = Route.baseUrl + route.description
    guard let url = urlString.asUrl else { return nil }
    var urlRequest = URLRequest(url: url)
    urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
    urlRequest.httpMethod = method.rawValue

    if let params = parameters {
      switch method {
        case .get:
          var urlComponent = URLComponents(string: urlString)
          urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)") }
          urlRequest.url = urlComponent?.url
        case .post, .delete, .patch:
          let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
          urlRequest.httpBody = bodyData
      }
    }
    return urlRequest
  }
}
