//
//  AppDelegate.swift
//  sociomile-sdk-ios
//
//  Created by Meynisa on 01/02/23.
//

import Foundation
import UserNotifications
import Firebase
import UIKit
import SociomileSDK

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    
    let fcmMessageID = "gcm.message_id"
    
    var notif: NSDictionary?
    
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      
      FirebaseApp.configure()
      Messaging.messaging().delegate = self
      
      if #available(iOS 10.0, *){
          UNUserNotificationCenter.current().delegate = self
          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in})
      }else{
          let settings: UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
          application.registerUserNotificationSettings(settings)
      }
      
      application.registerForRemoteNotifications()

    return true
  }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping(UIBackgroundFetchResult) -> Void){
        if let messageId = userInfo[fcmMessageID]{
            print("MessageID : \(messageId)")
        }
        print(userInfo)
        completionHandler(UIBackgroundFetchResult.newData)
    }
}

extension AppDelegate: MessagingDelegate{
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        let deviceToken : [String: String] = ["token": fcmToken ?? ""]
        print("Device token : ", deviceToken)
        
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.

        SocioDataModel.shared.fcmToken(fcmToken ?? "")
    }
}

@available(iOS 10, *)
extension AppDelegate: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        
        if let messageID = userInfo[fcmMessageID]{
            print("MessageID : \(messageID)")
        }
        print(userInfo)
        notif = userInfo as NSDictionary
        SocioDataModel.shared.notification(notif!)
        completionHandler([[.banner, .badge, .sound]])
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("Device Token :", deviceToken)
        Messaging.messaging().apnsToken = deviceToken
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Fail to Register : ", error.localizedDescription)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        if let messageID = userInfo[fcmMessageID]{
            print("Message ID from userNotificationCenter didReceive : \(messageID)")
        }
        
        print(userInfo)
        
        completionHandler()
    }
    
}

