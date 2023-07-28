//
//  UpcomingViewController.swift
//  MovieTrending
//
//  Created by Yaroslav on 12.07.23.
//

import UIKit

class UpcomingViewController: UIViewController {
  private var contentView: UpcomingView! {
    return view as? UpcomingView
  }

  override func loadView() {
    view = UpcomingView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
  }

}
