//
//  HomeTableViewCell.swift
//  MovieTrending
//
//  Created by Yaroslav on 2.08.23.
//

import UIKit

protocol HomeTableViewCellProtocol: AnyObject {
  var collectionView: UICollectionView! { get }
  func configure(with titles: [Movie])
}

final class HomeTableViewCell: UITableViewCell, HomeTableViewCellProtocol {
  @IBOutlet weak var collectionView: UICollectionView!

  private var movies: [Movie] = []

  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    setupCollectionViewFlowLayout()
  }

  private func setupUI() {

  }

  private func setupCollectionViewFlowLayout() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 140, height: collectionView.bounds.height)
    collectionView.collectionViewLayout = layout
    setupCollectionView()
  }

  private func setupCollectionView() {
    registerCell()
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.backgroundColor = .red
  }

  private func registerCell() {
    collectionView.registerNibCell(ofType: HomeCollectionViewCell.self)
  }

  func configure(with movies: [Movie]) {
    self.movies = movies
    DispatchQueue.main.async { [weak self] in
      guard let sSelf = self else { return }
      sSelf.collectionView.reloadData()
    }
  }
}

extension HomeTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableNibCell(of: HomeCollectionViewCell.self, forIndexPath: indexPath) as? HomeCollectionViewCell else {
      return UICollectionViewCell() }
    guard let model = movies[indexPath.row].poster_path else {
      return UICollectionViewCell() }
    cell.configure(with: model)
    return cell
  }
}

extension HomeTableViewCell: UICollectionViewDelegate {

}
