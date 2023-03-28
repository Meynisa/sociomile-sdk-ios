//
//  ShuffleView.swift
//  sociomile-sdk-ios
//
//  Created by Meynisa on 24/03/23.
//

import SwiftUI

struct ShuffleView: View {
    var body: some View {
        ZStack{
            Color(red: 0.961, green: 0.961, blue: 0.961).edgesIgnoringSafeArea(.all)
            Text("No Data Available").font(.custom("Inter", size: 14).weight(.bold)).foregroundColor(Color(red: 0.082, green: 0.114, blue: 0.231))
        }
    }
}

struct ShuffleView_Previews: PreviewProvider {
    static var previews: some View {
        ShuffleView()
    }
}
