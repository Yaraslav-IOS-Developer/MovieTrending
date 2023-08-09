//
//  HomeViewController.swift
//  MovieTrending
//
//  Created by Yaroslav on 12.07.23.
//

import UIKit


enum Sections: Int, CaseIterable {
  case TrendingMovies = 0
  case TrendingTV = 1
  case Popular = 2
  case UpcomingMoves = 3
  case TopRated = 4
}

final class HomeViewController: UIViewController {
  private var homeView: HomeViewProtocol
  private var headerView: HeroHeaderViewProtocol

  private var sectionTitles = [
    "Trending Movies",
    "Trending TV",
    "Popular",
    "Upcoming Moves",
    "Top Rated"
  ]

  init(
    homeView: HomeViewProtocol,
    headerView: HeroHeaderViewProtocol
  ) {
    self.homeView = homeView
    self.headerView = headerView
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

  override func viewDidAppear(_ animated: Bool) {
  super.viewDidAppear(animated)
    configureNavBar()
  }

  private func setupUI() {
    setupTableView()
  }

  private func configureNavBar() {
    var originalImage = UIImage(named: "NetflixLogo")
    originalImage = originalImage?.withRenderingMode(.alwaysOriginal)
    let resizedImageSize = CGSize(width: 50, height: 50)
    UIGraphicsBeginImageContextWithOptions(resizedImageSize, false, 0.0)
    originalImage?.draw(in: CGRect(origin: .zero, size: resizedImageSize))
    let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    let finalImage = resizedImage?.withRenderingMode(.alwaysOriginal)
    navigationItem.leftBarButtonItem = UIBarButtonItem(
      image: finalImage,
      style: .done,
      target: self,
      action: nil
    )

    navigationItem.rightBarButtonItems = [
      UIBarButtonItem(
        image: UIImage(systemName: "person"),
        style: .done,
        target: self,
        action: nil
      ),
      UIBarButtonItem(
        image: UIImage(systemName: "play.rectangle"),
        style: .done,
        target: self,
        action: nil
      )
    ]
    navigationController?.navigationBar.tintColor = .label
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
    homeView.tableView.tableHeaderView = headerView as? UIView
  }
}

extension HomeViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return sectionTitles.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableNibCell(of: HomeTableViewCell.self, forIndexPath: indexPath) as? HomeTableViewCell else { return UITableViewCell() }

    switch indexPath.section {
      case Sections.TrendingMovies.rawValue:
        cell.configure(with: [])

      case Sections.TrendingTV.rawValue:
        cell.configure(with: [])

      case Sections.Popular.rawValue:
        cell.configure(with: [])

      case Sections.UpcomingMoves.rawValue:
        cell.configure(with: [])

      case Sections.TopRated.rawValue:
        cell.configure(with: [])

      default:
        break
    }
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
     return 40
  }

  func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    guard let header = view as? UITableViewHeaderFooterView else { return }
    header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
    header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
    header.textLabel?.tintColor = .white
    header.textLabel?.text = header.textLabel?.text?.lowercased().capitalizedFirst()
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sectionTitles[section]
  }
}

extension HomeViewController: UITableViewDelegate {

}

extension HomeViewController {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let defaultOffset = view.safeAreaInsets.top
    let offset = scrollView.contentOffset.y + defaultOffset
    navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
  }
}
