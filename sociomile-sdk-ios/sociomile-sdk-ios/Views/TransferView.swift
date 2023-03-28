//
//  TransferView.swift
//  sociomile-sdk-ios
//
//  Created by Meynisa on 24/03/23.
//

import SwiftUI

struct TransferView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.961, green: 0.961, blue: 0.961).edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading){
                    Text("Choose Transfer Option").font(.custom("Inter", size: 14).weight(.bold)).foregroundColor(Color(red: 0.082, green: 0.114, blue: 0.231)).padding(.horizontal, 30).padding(.vertical, 8)
                    MenuTransferView(title: "Snap QR", icon: "qrcode.viewfinder")
                    MenuTransferView(title: "No. Virtual Account", icon: "creditcard")
                    MenuTransferView(title: "Bank Account Number", icon: "creditcard.and.123")
                    Spacer()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Transfer")
                        .bold()
                        .foregroundColor(Color(red: 0.082, green: 0.114, blue: 0.231))
                }
            }
        }
    }
}

struct MenuTransferView: View{
    var title : String
    var icon: String
    var isIconHidden: Bool = false

    var body: some View{
        HStack{
            if(isIconHidden == false){
                Image(systemName: icon).foregroundColor(.accentColor)
            }
            Text(title).font(.custom("Inter", size: 12).weight(.bold)).foregroundColor(Color(red: 0.082, green: 0.114, blue: 0.231))
            Spacer()
            Button{
            }label: {
                Image(systemName: "chevron.right").foregroundColor(Color(red: 0.168, green: 0.178, blue: 0.886))
            }
        }.padding(.horizontal, 30).padding(.vertical, 20).background(Color(.white))
    }
}

struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        TransferView()
    }
}
