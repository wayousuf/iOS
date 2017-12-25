//
//  ViewController.swift
//  SecondLocalNotification
//
//  Created by Waqas Yousuf on 12/24/17.
//  Copyright © 2017 Waqas Yousuf. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound ]) { (granted, error) in
            if granted {
                print("Notification access granted")
            } else {
                print(error?.localizedDescription as Any)
            }
        }
        
    }
    
    @IBAction func notifyButtonTapped(_ sender: Any) {
        scheduleNotification(inSecond: 5) { (success) in
            if success {
                print("Successfully scheduled notification")
            } else {
                print("Error scheduling notification")
            }
        }
    }
    
    func scheduleNotification(inSecond: TimeInterval, completion: @escaping (_ Success: Bool) -> ()) {
        
        let myImage = "baby_dance"
        guard let imageUrl = Bundle.main.url(forResource: myImage, withExtension: "gif") else {
            completion(false)
            return
        }
        
        var attachment: UNNotificationAttachment
        
        attachment = try! UNNotificationAttachment(identifier: "myNotification", url: imageUrl, options: .none)
        
        let notificationContect = UNMutableNotificationContent()
        
        notificationContect.title = "New Notification"
        notificationContect.subtitle = "These are great"
        notificationContect.body = "The new notification options in iOS 10 are what I've always dreamed of!"
        
        notificationContect.attachments = [attachment]
        
        notificationContect.categoryIdentifier = "myNotificationCategory"
        
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSecond, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: notificationContect, trigger: notificationTrigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                print(error as Any)
                completion(false)
            } else {
                completion(true)
            }
        }
        
    }
}

