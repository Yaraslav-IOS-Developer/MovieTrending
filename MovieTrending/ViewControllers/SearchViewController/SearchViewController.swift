//
//  SearchViewController.swift
//  MovieTrending
//
//  Created by Yaroslav on 12.07.23.
//

import UIKit

final class SearchViewController: UIViewController {
  private var contentView: SearchView! {
    return view as? SearchView
  }

  override func loadView() {
    view = SearchView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

  }
}
