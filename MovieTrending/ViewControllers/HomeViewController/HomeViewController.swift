//
//  HomeViewController.swift
//  MovieTrending
//
//  Created by Yaroslav on 12.07.23.
//

import UIKit

final class HomeViewController: UIViewController {
  private var homeView: HomeViewProtocol

  init(homeView: HomeViewProtocol) {
    self.homeView = homeView
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = homeView as? UIView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  private func setupUI() {
    setupTableView()
  }

  private func setupTableView() {
    registerCell()
    createHeaderView()
    homeView.tableView.delegate = self
    homeView.tableView.dataSource = self
  }

  private func registerCell() {
    homeView.tableView.registerNibCell(ofType: HomeTableViewCell.self)
  }

  private func createHeaderView() {
    homeView.tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
  }
}

extension HomeViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 20
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableNibCell(of: HomeTableViewCell.self, forIndexPath: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    40
  }
}

extension HomeViewController: UITableViewDelegate {

}
