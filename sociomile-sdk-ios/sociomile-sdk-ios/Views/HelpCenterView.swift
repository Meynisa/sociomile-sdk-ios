//
//  HelpCenterView.swift
//  sociomile-sdk-ios
//
//  Created by Meynisa on 27/03/23.
//

import SwiftUI
import SociomileSDK

struct HelpCenterView: View {
    
    let flutterDependencies = FlutterDependencies()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.961, green: 0.961, blue: 0.961).edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading){
                    Text("Choose Transfer Option").font(.custom("Inter", size: 14).weight(.bold)).foregroundColor(Color(red: 0.082, green: 0.114, blue: 0.231)).padding(.horizontal, 30).padding(.vertical, 8)
                    Button(action: showSociomile) {
                        MenuTransferView(title: "Hubungi", icon: "phone.and.waveform")
                    }
                    MenuTransferView(title: "Email", icon: "envelope")
                    Spacer()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Help Center")
                        .bold()
                        .foregroundColor(Color(red: 0.082, green: 0.114, blue: 0.231))
                }
            }
        }
    }
    
    func showSociomile(){
        
        SocioDataModel.shared.initialize(clientKey: "BBB", clientId: "AAA", userId: "6281288682850", userName: "Zafran")
        SocioDataModel.shared.setLog(false)
        SocioDataModel.shared.setDarkMode(false)
        
        let sociomile = Sociomile(bgColorSender: 0xFFFFFFFF)
        
        sociomile.runSociomileEngine(flutterDependency: flutterDependencies)

        flutterDependencies.sociomileActivity()
    }

}

struct HelpCenterView_Previews: PreviewProvider {
    static var previews: some View {
        HelpCenterView()
    }
}

