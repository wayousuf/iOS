//
//  ViewController.swift
//  FirstLocalNotificationExample
//
//  Created by Waqas Yousuf on 12/24/17.
//  Copyright © 2017 Waqas Yousuf. All rights reserved.
//

import UIKit

import  UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func getProblemBtnTapped(_ sender: Any) {
        
        let mathContent = UNMutableNotificationContent()
        mathContent.title = "Math Quiz"
        mathContent.subtitle = "Do you remember high school algebra?"
        mathContent.body = "What is the equation for slope-intercept form?"
        mathContent.badge = 1
        mathContent.categoryIdentifier = "mathQuizCategory"
        
        let quizTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        
        let quizRequestIdentifier = "mathQuiz"
        let request = UNNotificationRequest(identifier: quizRequestIdentifier, content: mathContent, trigger: quizTrigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            print(error as Any)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UNUserNotificationCenter.current().delegate = self;
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.actionIdentifier == "y = mx + b" {
            resultLabel.text = "That's the correct answer!"
        } else if response.actionIdentifier == "Ax + By = C" {
            resultLabel.text = "Sorry, that's the standard from equation."
        } else {
            resultLabel.text = "Keep trying!"
        }
    }
}

