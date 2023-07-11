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

  private var mainViewModel: MainViewModel = MainViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }

  private func configureView() {
    title = "Main View"
    setupTableView()
  }

  private func setupTableView() {
    contentView.tableView.delegate = self
    contentView.tableView.dataSource = self
    contentView.tableView.backgroundColor = .clear
    registerCell()
  }

  private func registerCell() {
    contentView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
}

extension MainViewController: UITableViewDelegate {

}

extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return mainViewModel.numberRowInSections(in: section)
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = "\(indexPath.row)"
    return cell
  }
}
