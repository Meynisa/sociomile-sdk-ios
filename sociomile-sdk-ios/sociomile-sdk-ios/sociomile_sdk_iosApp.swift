//
//  sociomile_sdk_iosApp.swift
//  sociomile-sdk-ios
//
//  Created by Meynisa on 26/01/23.
//

import SwiftUI
import UIKit

@main
struct sociomile_sdk_iosApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
