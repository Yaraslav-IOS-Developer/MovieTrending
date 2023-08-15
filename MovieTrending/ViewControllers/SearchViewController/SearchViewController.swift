//
//  SearchViewController.swift
//  MovieTrending
//
//  Created by Yaroslav on 12.07.23.
//

import UIKit

final class SearchViewController: UIViewController {
  private let searchView: SearchViewProtocol


  private var searchViewController: UISearchController

  init(searchView: SearchViewProtocol, searchViewController: UISearchController) {
    self.searchView = searchView
    self.searchViewController = searchViewController
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = searchView as? UIView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  private func setupUI() {
    setupSearchView()
  }

  private func setupSearchView() {
    searchViewController.searchBar.placeholder = "Search for a Movie a Tv show"
    searchViewController.searchBar.searchBarStyle = .minimal
    searchViewController.searchResultsUpdater = self
    navigationItem.searchController = searchViewController
    navigationController?.navigationBar.tintColor = .label

  }
}

extension SearchViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar

    guard let query = searchBar.text,
          !query.trimmingCharacters(in: .whitespaces).isEmpty,
          query.trimmingCharacters(in: .whitespaces).count >= 3,
          let resultController = searchController.searchResultsController as? SearchResultViewController else {
      return
    }
    MoviesNetwork.shared.search(with: query) { result in
      DispatchQueue.main.async {
        switch result {
          case .success(let movies):
            resultController.movies = movies
            resultController.searchResultView.collectionView.reloadData()
          case .failure(let error):
            print(error.localizedDescription)
        }
      }
    }
  }
}
