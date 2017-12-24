//
//  AppDelegate.swift
//  FirstLocalNotificationExample
//
//  Created by Waqas Yousuf on 12/24/17.
//  Copyright © 2017 Waqas Yousuf. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (permissionGranted, error) in
            print(error as Any)
        }
        
        let choiceA = UNNotificationAction(identifier: "y = mx + b", title: "y = mx + b", options: [.foreground])
        let choiceB = UNNotificationAction(identifier: "Ax + By = C", title: "Ax + By = C", options: [.foreground])
        let choiceC = UNNotificationAction(identifier: "A = LW", title: "A = LW", options: [.foreground])
        let choiceD = UNNotificationAction(identifier: "D = lw", title: "D = lw", options: [.foreground])
        
        let mathQuizCategory = UNNotificationCategory(identifier: "mathQuizCategory", actions: [choiceA, choiceB, choiceC, choiceD], intentIdentifiers: [], options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([mathQuizCategory])
        
        return true
    }

    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

