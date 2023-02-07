//
//  ContentView.swift
//  sociomile-sdk-ios
//
//  Created by Meynisa on 26/01/23.
//

import SwiftUI
import CoreData
import SociomileSDK

struct ContentView: View {
    @StateObject var flutterDependencies = FlutterDependencies()
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Chat") {
                        showSociomile()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    func showSociomile(){
        
        let sociomile = Sociomile(bgColorSender: 0xFF33E05E, bgColorOwner: 0xFF384191, colorThemeDefault: 0xFF384191, colorBtnSend: 0xFF384191, colorIconDefault: 0xFF384191, lblColorMsgSender: 0xFFFFFFFF, lblColorMsgOwner: 0xFFFFFFFF, lblColorThemeDefault: 0xFF389400, fontFromNative: "Lato", clientKey: "BBB", clientId: "AAA", userId: "6281288682850", userName: "Zafran", fcmToken: "\(SocioDataModel.shared.getToken())")
        sociomile.runSociomileEngine(flutterDependency: flutterDependencies)

        flutterDependencies.sociomileActivity()
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
