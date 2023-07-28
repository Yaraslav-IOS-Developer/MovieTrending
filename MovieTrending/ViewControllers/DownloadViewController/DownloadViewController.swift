//
//  DownloadViewController.swift
//  MovieTrending
//
//  Created by Yaroslav on 12.07.23.
//

import UIKit

final class DownloadViewController: UIViewController {
  private var contentView: DownloadView! {
    return view as? DownloadView
  }

  override func loadView() {
    view = DownloadView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
