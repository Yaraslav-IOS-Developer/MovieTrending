//
//  HeroHeaderView.swift
//  MovieTrending
//
//  Created by Yaroslav on 4.08.23.
//

import UIKit



protocol HeroHeaderViewProtocol: AnyObject {
  var contentView: UIView! { get }
  var heroImageView: UIImageView! { get set }
  var playButton: UIButton! { get set }
  var downloadButton: UIButton! { get set }
}

protocol HeroHeaderViewDelegate: AnyObject {
  func playButton()
  func downloadButton()
}

final class HeroHeaderView: UIView, HeroHeaderViewProtocol {
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var heroImageView: UIImageView!
  @IBOutlet weak var playButton: UIButton!
  @IBOutlet weak var downloadButton: UIButton!

  weak var delegate: HeroHeaderViewDelegate?

  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    addGradient()
  }

  private func commonInit() {
    Bundle.main.loadNibNamed("\(type(of: self))", owner: self, options: nil)

    addSubview(contentView)

    contentView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: topAnchor),
      contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
      contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
      contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    setupUI()
  }

  private func setupUI() {
    setupImageView()
    setupButtons()
    setupButtons()
  }

  private func setupImageView() {
    heroImageView.contentMode = .scaleAspectFill
    heroImageView.clipsToBounds = true
    heroImageView.image = UIImage(named: "HeroesPreview")
  }

  private func setupButtons() {
    playButton.setTitle("Play", for: .normal)
    playButton.tintColor = .white
    playButton.layer.borderColor = UIColor.white.cgColor
    playButton.layer.borderWidth = 1
    playButton.layer.cornerRadius = 5

    downloadButton.setTitle("Download", for: .normal)
    downloadButton.tintColor = .white
    downloadButton.layer.borderColor = UIColor.white.cgColor
    downloadButton.layer.borderWidth = 1
    downloadButton.layer.cornerRadius = 5
  }

  private func addGradient() {
   let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [
      UIColor.clear.cgColor,
      UIColor.systemBackground.cgColor
      ]
    gradientLayer.locations = [0.8, 1.0]

    gradientLayer.frame = bounds
    heroImageView.layer.addSublayer(gradientLayer)
  }
}
