//
//  ContentView.swift
//  SwiftUIFontIconDemo_Pods_osx
//
//  Created by Huy Bui Dac on 26/08/2020.
//  Copyright © 2020 Huy Bui Dac. All rights reserved.
//

import SwiftUI
import SwiftUIFontIcon

struct ContentView: View {
    var body: some View {
        VStack {
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
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
