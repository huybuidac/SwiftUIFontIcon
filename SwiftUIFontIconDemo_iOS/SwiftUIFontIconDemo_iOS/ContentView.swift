//
//  ContentView.swift
//  SwiftUIFontIconDemo_iOS
//
//  Created by Huy Bui Dac on 26/08/2020.
//  Copyright © 2020 Huy Bui Dac. All rights reserved.
//

import SwiftUI
import SwiftUIFontIcon

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center){
                Text("Material icon:").frame(width: 150, alignment: .trailing)
                FontIcon.text(.materialIcon(code: .person))
                Spacer()
            }.frame(height: 80)
            HStack{
                Text("ionicons:").frame(width: 150, alignment: .trailing)
                FontIcon.text(.ionicon(code: .md_people), color: .white)
                    .background(Color.blue)
                Spacer()
            }.frame(height: 80)
            HStack{
                Text("Font Awesome 5:").frame(width: 150, alignment: .trailing)
                FontIcon.text(.awesome5Solid(code: .ad), fontsize: 24)
                    .foregroundColor(.pink)
                Spacer()
            }.frame(height: 80)
            HStack{
                Text("Create button:").frame(width: 150, alignment: .trailing)
                FontIcon.button(.ionicon(code: .md_add_circle), action: {})
                FontIcon.button(.materialIcon(code: .settings), action: {}, padding: 8)
                    .background(RoundedRectangle(cornerRadius: 4).foregroundColor(.blue))
            }.frame(height: 80)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
