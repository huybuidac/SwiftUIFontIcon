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
            HStack{
                Text("Material icon:").frame(width: 150)
                FontIcon(.materialIcon(code: .battery_std))
            }
            HStack{
                Text("ionicons:").frame(width: 150)
                FontIcon(.ionicon(code: .md_people), color: .red, fontsize: 30)
            }
            HStack{
                Text("Font Awesome 5:").frame(width: 150)
                FontIcon(.awesome5Solid(code: .ad), color: .blue, fontsize: 30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
