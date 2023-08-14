//
//  UpcomingTableViewCell.swift
//  MovieTrending
//
//  Created by Yaroslav on 14.08.23.
//

import UIKit

final class UpcomingTableViewCell: UITableViewCell {
  @IBOutlet weak var previewImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var playButton: UIButton!

  func configure(with model: Movie) {
    guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.poster_path ?? "")") else { return }
    previewImageView.sd_setImage(with: url)
    titleLabel.text = model.original_title ?? model.original_name ?? "Unknown title name"
  }
}
