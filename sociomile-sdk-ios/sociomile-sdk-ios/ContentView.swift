//
//  ContentView.swift
//  sociomile-sdk-ios
//
//  Created by Meynisa on 26/01/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    init() {
            UITabBar.appearance().backgroundColor = UIColor.white
        }
    
    var body: some View {

        if UIDevice.isIpad{
              NavigationView {
                List {
                  NavigationLink(destination: HomeView()) {
                    Label("Dashboard", systemImage: "house")
                  }
                    NavigationLink(destination: ShuffleView()) {
                      Label("Shuffle", systemImage: "shuffle")
                    }
                    NavigationLink(destination: NotifView()) {
                      Label("Notification", systemImage: "bell")
                    }
                    NavigationLink(destination: ProfileView()) {
                      Label("Profile", systemImage: "person")
                    }

                }
                  HomeView()
              }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            } else {
                NavigationView {
                    TabView{
                        HomeView().tabItem(){
                            Image(systemName: "house")
                        }
                        ShuffleView().tabItem(){
                            Image(systemName: "shuffle")
                        }
                        NotifView().tabItem(){
                            Image(systemName: "bell")
                        }
                        ProfileView().tabItem(){
                            Image(systemName: "person")
                        }
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

extension UIDevice {
  static var idiom: UIUserInterfaceIdiom {
    UIDevice.current.userInterfaceIdiom
  }
}

extension UIDevice {
static var isIpad: Bool {
    idiom == .pad
  }
  
  static var isiPhone: Bool {
    idiom == .phone
  }
}

