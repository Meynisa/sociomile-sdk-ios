//
//  HomeView.swift
//  sociomile-sdk-ios
//
//  Created by Meynisa on 24/03/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color(red: 0.961, green: 0.961, blue: 0.961).edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                ScrollView(.vertical, showsIndicators: false){
                    TopView()
                    Spacer(minLength: 16)
                    MiddleView()
                    Spacer(minLength: 16)
                    BottomView()
                }
            }.edgesIgnoringSafeArea([.top, .leading, .trailing]).padding(.bottom, 16)
        }
    }
}

struct BottomView: View{
    var body: some View{
        VStack{
            HStack{
                Text("Current Transaction").font(.custom("Inter", size: 14).weight(.bold)).foregroundColor(Color(red: 0.082, green: 0.114, blue: 0.231))
                Spacer()
                Text("See All").underline().font(.custom("Inter", size: 14).weight(.bold)).foregroundColor(Color(.blue))
            }.padding(.bottom, 6)
            ScrollView(.vertical, showsIndicators: false){
                TransactionView(title: "Transfer to BRI", subtitle: "Amira Leswana", date: "7 March 2023", total: "Rp 2.000.000")
                TransactionView(title: "Transfer to BRI", subtitle: "Dendi K.W", date: "5 March 2023", total: "Rp 10.000.000")
                TransactionView(title: "Receive from BRI", subtitle: "Galaridha", date: "1 March 2023", total: "Rp 300.000")
                TransactionView(title: "Receive from BNI", subtitle: "Dendi K.W", date: "30 February 2023", total: "Rp 9.000.000")
                TransactionView(title: "Transfer to BRI", subtitle: "Dendi K.W", date: "15 February 2023", total: "Rp 872.000")
            }
        }.padding(.horizontal, 30)
    }
}

struct TransactionView: View{
    var title: String
    var subtitle: String
    var date: String
    var total: String
    
    var body: some View{
        HStack(alignment: .top){
            Image("ic_user").resizable().frame(width: 40, height: 40).padding(.trailing, 16)
            VStack(alignment: .leading){
                Text(title).font(.custom("Inter", size: 12).weight(.bold)).foregroundColor(Color(red: 0.082, green: 0.114, blue: 0.231))
                Text(subtitle).font(.custom("Inter", size: 12).weight(.light)).foregroundColor(Color(red: 0.082, green: 0.114, blue: 0.231))
                Text(date).font(.custom("Inter", size: 10).weight(.light)).foregroundColor(Color(red: 0.082, green: 0.114, blue: 0.231))
            }
            Spacer()
            Text(total).font(.custom("Inter", size: 12).weight(.light)).foregroundColor(Color(red: 0.082, green: 0.114, blue: 0.231))
        }.padding(.horizontal, 16).padding(.vertical, 10).background(Color(.white)).cornerRadius(5)
    }
}

struct MiddleView: View{
    var body: some View{
        VStack(alignment: .leading){
            Text("Transactions").font(.custom("Inter", size: 14).weight(.bold)).foregroundColor(Color(red: 0.082, green: 0.114, blue: 0.231)).padding(.bottom, 8)
            HStack{
                MenuView(title: "All", color: Color(red: 0.082, green: 0.114, blue: 0.231), titleColor: .white)
                Spacer()
                NavigationLink(destination: TransferView(), label: {
                    MenuView(title: "Transfer", color: Color(.white), titleColor: Color(red: 0.082, green: 0.114, blue: 0.231))
                })
                Spacer()
                MenuView(title: "Withdraw", color: Color(.white), titleColor: Color(red: 0.082, green: 0.114, blue: 0.231))
                Spacer()
                MenuView(title: "Top Up", color: Color(.white), titleColor: Color(red: 0.082, green: 0.114, blue: 0.231))
                Spacer()
                MenuView(title: "More", color: Color(.white), titleColor: Color(red: 0.082, green: 0.114, blue: 0.231))
            }
        }.padding(.vertical, 20).padding(.horizontal, 30).background(Color(.white))
    }
}

struct MenuView: View{
    var title: String
    var color: Color
    var titleColor: Color
    
    var body: some View{
        Text(title).font(.custom("Inter", size: 12).weight(.bold)).foregroundColor(titleColor)
        .padding(5)
        .background(color)
        .border(Color(red: 0.082, green: 0.114, blue: 0.231), width: 1)
        .cornerRadius(4)
    }
}

struct TopView: View{
    var body: some View{
        ZStack{
            Image("ic_map").resizable()
            VStack(alignment: .leading){
                HStack(){
                    Image("ic_user").resizable().frame(width: 40, height: 40).padding(.trailing, 16)
                    VStack(alignment: .leading){
                        Text("Danish").font(.custom("Inter", size: 14).weight(.bold)).foregroundColor(.white)
                        Text("Personal Account").font(.custom("Inter", size: 12).weight(.semibold)).foregroundColor(.white)
                    }
                }.padding(.horizontal, 30).padding(.top, 8)
                HStack(){
                    Text("Balance").font(.custom("Inter", size: 14).weight(.bold)).foregroundColor(.white)
                    Spacer()
                    Text("Rp 2.000.000").font(.custom("Inter", size: 14).weight(.bold)).foregroundColor(.white)
                }.padding(.horizontal, 30).padding([.bottom, .top], 24)
                HStack(){
                    NavigationLink(destination: TransferView(), label: {
                        ButtonView(icon: "paperplane", title: "Transfer")
                    })
                    Spacer()
                    ButtonView(icon: "arrow.up.doc", title: "Withdraw")
                    Spacer()
                    ButtonView(icon: "ic_edit", title: "Withdraw", isSystemIcon: false)
                    Spacer()
                    ButtonView(icon: "ic_interface", title: "Withdraw", isSystemIcon: false)
                }.padding(.horizontal, 30).padding(.vertical, 10)
            }
        }.padding(.top, 64).padding(.bottom, 8)
            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0, green: 0.004, blue: 0.311), Color(red: 0.227, green: 0.376, blue: 0.451)]), startPoint: UnitPoint(x: 0.25, y: 0.5), endPoint: UnitPoint(x: 0.75, y: 0.5)))
    }
}

struct ButtonView: View{
    var icon:String
    var title: String
    var isSystemIcon: Bool = true
    
    var body: some View{
        VStack{
            ZStack{
                if(isSystemIcon) {
                    Image(systemName: icon).foregroundColor(.accentColor)}
                else{
                    Image(icon).resizable().foregroundColor(.accentColor)}
            }.padding(10).frame(width: 40, height: 40).background(Color(.white)).cornerRadius(5)
            Text(title).font(.custom("Inter", size: 12).weight(.bold)).foregroundColor(.white)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
