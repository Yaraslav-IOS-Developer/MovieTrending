//
//  NavigationImp- UINavigationControllerDelegate.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import UIKit


extension NavigationImp: UINavigationControllerDelegate {
  func navigationController(
    _ navigationController: UINavigationController,
    didShow viewController: UIViewController,
    animated: Bool
  ) {
    guard let controller = navigationController.transitionCoordinator?.viewController(forKey: .from),
          !navigationController.viewControllers.contains(controller)
    else { return }
    guard let completion = completions[controller] else { return }
    completion()
    completions.removeValue(forKey: controller)
  }
}
