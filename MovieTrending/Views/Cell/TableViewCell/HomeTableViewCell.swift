//
//  HomeTableViewCell.swift
//  MovieTrending
//
//  Created by Yaroslav on 2.08.23.
//

import UIKit

protocol HomeTableViewCellProtocol: AnyObject {
  var collectionView: UICollectionView! { get }

}

final class HomeTableViewCell: UITableViewCell, HomeTableViewCellProtocol {
  @IBOutlet weak var collectionView: UICollectionView!

  override func awakeFromNib() {
    super.awakeFromNib()

  }

  override func layoutSubviews() {
    super.layoutSubviews()
    setupUI()
  }

  private func setupUI() {
    setupCollectionViewFlowLayout()
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
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
  }
}

extension HomeTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    cell.backgroundColor = .green
    return cell
  }
}

extension HomeTableViewCell: UICollectionViewDelegate {

}
