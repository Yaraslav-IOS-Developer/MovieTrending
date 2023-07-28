//
//  AppDelegate.swift
//  MovieTrending
//
//  Created by Yaroslav on 10.07.23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var appCoordinator: CoordinatorProtocol?
  var appFactory: AppFactoryProtocol?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    appFactory = AppFactory()
    appCoordinator = AppCoordinator(
      navigation: NavigationImp(rootViewController: UINavigationController()),
      window: window,
      factory: appFactory
    )
    appCoordinator?.start()

    return true
  }
}

