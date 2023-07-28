//
//  HomeViewController.swift
//  MovieTrending
//
//  Created by Yaroslav on 12.07.23.
//

import UIKit

final class HomeViewController: UIViewController {
  private var contentView: HomeView! {
    return view as? HomeView
  }

  override func loadView() {
    view = HomeView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
