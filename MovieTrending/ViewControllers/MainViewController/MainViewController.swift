//
//  MainViewController.swift
//  MovieTrending
//
//  Created by Yaroslav on 10.07.23.
//

import UIKit

final class MainViewController: UIViewController {
  private var contentView: MainView! {
    return view as? MainView
  }

  override func loadView() {
    view = MainView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Main View" 
  }
}
