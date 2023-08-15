//
//  SearchResultViewController.swift
//  MovieTrending
//
//  Created by Yaroslav on 14.08.23.
//

import UIKit

final class SearchResultViewController: UIViewController {
  public let searchResultView: SearchResultViewProtocol
  public var movies: [Movie] = []

  init(searchResultView: SearchResultViewProtocol) {
    self.searchResultView = searchResultView
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = searchResultView as? UIView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  private func setupUI() {
    setupCollectionLayout()
  }

  private func setupCollectionLayout() {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .vertical
    setupCollectionView(layout: layout)
  }

  private func setupCollectionView(layout: UICollectionViewFlowLayout) {
    registerCell()
    searchResultView.collectionView.delegate = self
    searchResultView.collectionView.dataSource = self
    searchResultView.collectionView.collectionViewLayout = layout
  }

  private func registerCell() {
    searchResultView.collectionView.registerNibCell(ofType: HomeCollectionViewCell.self)
  }
}

extension SearchResultViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableNibCell(of: HomeCollectionViewCell.self, forIndexPath: indexPath) as?  HomeCollectionViewCell else {
      return UICollectionViewCell() }
    cell.configure(with: movies[indexPath.row].poster_path ?? "")
    return cell
  }
}

extension SearchResultViewController: UICollectionViewDelegate {

}
