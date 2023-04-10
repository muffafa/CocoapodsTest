//  AppDelegate.swift
//  CocoapodsTest
//
//  Created by Muhammed Mustafa Savar on 9.04.2023.
//

import UIKit
import SnapKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        IQKeyboardManager.shared.enable = true
        
        return true
    }

}

