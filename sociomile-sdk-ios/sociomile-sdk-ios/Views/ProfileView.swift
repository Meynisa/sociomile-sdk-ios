//
//  ProfileView.swift
//  sociomile-sdk-ios
//
//  Created by Meynisa on 24/03/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
            ZStack{
                Color(red: 0.961, green: 0.961, blue: 0.961).edgesIgnoringSafeArea(.all)
                VStack(alignment: .center){
                    ScrollView(.vertical, showsIndicators: false){
                        ZStack{
                            VStack{
                                Text("Profile").font(.custom("Inter", size: 16).weight(.bold)).foregroundColor(Color(red: 0.082, green: 0.114, blue: 0.231)).padding(.top, 44).padding(.bottom, 16)
                                CardView()
                            }.background(Color(.white)).padding(.bottom, 16)
                        }.edgesIgnoringSafeArea(.top).background(Color(.white))
                        ListMenu()
                        Spacer()
                        Text("Log Out").font(.custom("Inter", size: 14).weight(.bold)).foregroundColor(.red).frame(maxWidth: .infinity).padding(16).background(Color(.white)).border(Color(.red), width: 1).cornerRadius(5).padding(.horizontal, 30).padding(.bottom, 20).padding(.top, 10)
                    }
                }.edgesIgnoringSafeArea([.top, .leading, .trailing])
            }
    }
}

struct ListMenu: View{
    var body: some View{
        MenuTransferView(title: "Account", icon: "qrcode.viewfinder", isIconHidden: true)
        MenuTransferView(title: "Debit Card Setting", icon: "qrcode.viewfinder", isIconHidden: true)
        MenuTransferView(title: "Security", icon: "qrcode.viewfinder", isIconHidden: true)
        MenuTransferView(title: "Language", icon: "qrcode.viewfinder", isIconHidden: true)
        MenuTransferView(title: "FAQ", icon: "qrcode.viewfinder", isIconHidden: true)
        NavigationLink(destination: HelpCenterView(), label: {
            MenuTransferView(title: "Help Center", icon: "qrcode.viewfinder", isIconHidden: true)
        })
    }
}

struct CardView: View{
    var body: some View{
        ZStack{
            Image("ic_map").resizable()
            HStack{
                VStack(alignment: .leading){
                    Text("Danish Suryo W.").font(.custom("Inter", size: 14).weight(.bold)).foregroundColor(.white)
                        .padding(.vertical, 10)
                    Image("ic_chip").resizable().frame(width: 50, height: 40).padding(.trailing, 16)
                        .padding(.bottom, 20)
                    HStack{
                        Text("35-070-0003-3256-2022").font(.custom("Inter", size: 11).weight(.bold)).foregroundColor(.white).padding(.trailing, 10)
                        Image(systemName: "doc.on.doc").frame(width: 15, height: 15).foregroundColor(Color(.white)).padding(.trailing, 3)
                        Text("Copy").font(.custom("Inter", size: 11).weight(.bold)).foregroundColor(.white)
                    }
                    .padding(.bottom, 20)
                    Text("Exp. 12/26").font(.custom("Inter", size: 11).weight(.bold)).foregroundColor(.white).padding(.bottom, 10)
                }.padding(.leading, 20).padding(.trailing, 10)
                Spacer()
                VStack{
                    Text("Java Bank").font(.custom("Inter", size: 14).weight(.bold).italic()).foregroundColor(.white)
                    Spacer()
                    VStack{
                        Image("ic_mastercard").resizable().frame(width: 50, height: 30)
                        Text("Mastercard").font(.custom("Inter", size: 10).weight(.bold).italic()).foregroundColor(.white)
                    }
                }.padding(.vertical, 10).padding(.trailing, 20)
            }
        }.padding(.top, 24).padding(.bottom, 8).background(LinearGradient(gradient: Gradient(colors: [Color(red: 0, green: 0.004, blue: 0.311), Color(red: 0.227, green: 0.376, blue: 0.451)]), startPoint: UnitPoint(x: 0.25, y: 0.5), endPoint: UnitPoint(x: 0.75, y: 0.5)))
            .fixedSize(horizontal: false, vertical: true).cornerRadius(5).padding(.horizontal, 30)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

