//
//  NTCManager.swift
//  p3m5_5
//
//  Created by Amina TomasMart on 28.03.2024.
//

import Foundation
import UserNotifications

class NTCManager {
    
    static let shared = NTCManager()
    private init(){}
    
    func notificationAuth() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { isOn, error in
            guard error == nil else {return}
            if isOn {
                self.sendNotification()
            }
        }
    }
    
    private func sendNotification() {
        
        let nt = UNMutableNotificationContent()
        nt.title = "Привет!"
        nt.body = "Как дела? Что делаешь? Не забудь перезвонить мне"
        nt.badge = 1
        
        let ntId = "nt1"
        
        let timeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
        
        var dateComponent = DateComponents()
        dateComponent.hour = 16
        dateComponent.minute = 06
        
        let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        
        let request = UNNotificationRequest(identifier: ntId, content: nt, trigger: timeTrigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func outNotification() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
