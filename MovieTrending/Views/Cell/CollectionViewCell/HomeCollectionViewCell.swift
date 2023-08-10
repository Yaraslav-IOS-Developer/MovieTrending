//
//  HomeCollectionViewCell.swift
//  MovieTrending
//
//  Created by Yaroslav on 9.08.23.
//

import UIKit
import SDWebImage

final class HomeCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var posterImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

  func configure(with model: String) {
    guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model)") else { return }
    posterImageView.sd_setImage(with: url)
  }
}
