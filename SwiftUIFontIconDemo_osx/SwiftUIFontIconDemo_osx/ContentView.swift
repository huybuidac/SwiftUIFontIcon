//
//  ContentView.swift
//  SwiftUIFontIconDemo_osx
//
//  Created by Huy Bui Dac on 26/08/2020.
//  Copyright © 2020 Huy Bui Dac. All rights reserved.
//

import SwiftUI
import SwiftUIFontIcon

struct ContentView: View {
    var body: some View {
        HStack {
            List{
                HStack {
                    Text("Material Icon Code").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).frame(width: 200, alignment: .leading)
                    Text("Icon").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).frame(width: 100, alignment: .leading)
                }
                ForEach(MaterialIconCode.allCases, id: \.self) { code in
                    HStack{
                        Text(String(reflecting: code).split(separator: ".").last!)
                            .frame(width: 200, alignment: .leading)
                        FontIcon(.materialIcon(code: code), color: .pink, fontsize: 40)
                    }
                }
            }
//            List{
//                HStack {
//                    Text("ionicons Code").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).frame(width: 200, alignment: .leading)
//                    Text("Icon").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).frame(width: 100, alignment: .leading)
//                }
//                ForEach(IonIconsCode.allCases, id: \.self) { code in
//                    HStack{
//                        Text(String(reflecting: code).split(separator: ".").last!)
//                            .frame(width: 200, alignment: .leading)
//                        FontIcon(.ionicon(code: code))
//                    }
//                }
//            }
//            List{
//                HStack {
//                    Text("Awesome 5 solid Code").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).frame(width: 200, alignment: .leading)
//                    Text("Icon").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).frame(width: 100, alignment: .leading)
//                }
//                ForEach(FontAwesomeCode.allCases, id: \.self) { code in
//                    HStack{
//                        Text(String(reflecting: code).split(separator: ".").last!)
//                            .frame(width: 200, alignment: .leading)
//                        FontIcon(.awesome5Solid(code: code))
//                    }
//                }
//            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
