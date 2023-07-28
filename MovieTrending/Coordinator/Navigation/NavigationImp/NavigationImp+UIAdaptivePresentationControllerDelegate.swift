//
//  NavigationImp+UIAdaptivePresentationControllerDelegate.swift
//  MovieTrending
//
//  Created by Yaroslav on 28.07.23.
//

import UIKit


extension NavigationImp: UIAdaptivePresentationControllerDelegate {
  func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
    dismissNavigation?()
    dismissNavigation = nil
  }
}
