//
//  NavigationImp.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import UIKit


final class NavigationImp: NSObject {
  var rootViewController: UINavigationController
  var dismissNavigation: (() -> Void)?
  var completions: [UIViewController: () -> Void] = [ : ]

  init(rootViewController: UINavigationController) {
    self.rootViewController = rootViewController
    super.init()
    rootViewController.delegate = self
    rootViewController.presentationController?.delegate = self
  }
}
