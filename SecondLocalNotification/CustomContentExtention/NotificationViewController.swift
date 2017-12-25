//
//  NotificationViewController.swift
//  CustomContentExtention
//
//  Created by Waqas Yousuf on 12/24/17.
//  Copyright © 2017 Waqas Yousuf. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        guard let attachment = notification.request.content.attachments.first else {
            return
        }
        
        if attachment.url.startAccessingSecurityScopedResource() {
           let imageData = try? Data.init(contentsOf: attachment.url)
            if let img = imageData {
                imageView.image = UIImage(data: img)
            }
        }
    }
    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        if response.actionIdentifier == "likeThumb" {
            completion(.dismissAndForwardAction)
        } else if (response.actionIdentifier == "dismiss") {
            completion(.dismissAndForwardAction)
        }
    }
}
