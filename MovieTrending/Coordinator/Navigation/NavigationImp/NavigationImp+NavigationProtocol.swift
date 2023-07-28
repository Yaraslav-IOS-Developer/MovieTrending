//
//  NavigationImp+NavigationProtocol.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import UIKit


extension NavigationImp: NavigationProtocol {
  var viewController: [UIViewController] {
    get {
      rootViewController.viewControllers
    }
    set {
      rootViewController.viewControllers = newValue
    }
  }

  var navigationBar: UINavigationBar {
    rootViewController.navigationBar
  }

  func present(_ viewControllerToPresent: UIViewController, animate: Bool) {
    rootViewController.present(viewControllerToPresent, animated: animate)
  }

  func dismiss(animate: Bool) {
    rootViewController.dismiss(animated: animate)
  }

  func pushViewController(_ viewControllerToPresent: UIViewController, animate: Bool, completion: (() -> Void)?) {
    if let completion = completion {
      completions[viewControllerToPresent] = completion
    }
    rootViewController.pushViewController(viewControllerToPresent, animated: animate)
  }
}
