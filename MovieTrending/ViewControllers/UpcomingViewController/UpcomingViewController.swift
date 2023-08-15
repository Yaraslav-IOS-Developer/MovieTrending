//
//  UpcomingViewController.swift
//  MovieTrending
//
//  Created by Yaroslav on 12.07.23.
//

import UIKit

final class UpcomingViewController: UIViewController {
  private let upcomingView: UpcomingViewProtocol
  private var movies: [Movie] = []

  init(upcomingView: UpcomingViewProtocol) {
    self.upcomingView = upcomingView
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = upcomingView as? UIView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  private func setupUI() {
    fetchUpcoming()
    setupTableView()
  }
  
  private func setupTableView() {
    registerCell()
    upcomingView.tableView.delegate = self
    upcomingView.tableView.dataSource = self
  }

  private func registerCell() {
    upcomingView.tableView.registerNibCell(ofType: UpcomingTableViewCell.self)
  }

  private func fetchUpcoming() {
    MoviesNetwork.shared.fetchUpcomingMoves { [weak self] result in
      guard let sSelf = self else { return }
      switch result {
        case .success(let movies):
          sSelf.movies = movies
          DispatchQueue.main.async {
            sSelf.upcomingView.tableView.reloadData()
          }
        case .failure(let failure):
          print(failure)
      }
    }
  }
}

extension UpcomingViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableNibCell(of: UpcomingTableViewCell.self, forIndexPath: indexPath) as? UpcomingTableViewCell else {
      return UITableViewCell()
    }
    cell.configure(with: movies[indexPath.row])
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
}

extension UpcomingViewController: UITableViewDelegate {

}
