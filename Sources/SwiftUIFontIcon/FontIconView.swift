//
//  File.swift
//  
//
//  Created by Huy Bui Dac on 25/08/2020.
//

#if canImport(UIKit)
import UIKit
#endif
#if canImport(AppKit)
import AppKit
#endif

import Foundation
import SwiftUI

public class FontIcon {
    public static func text(_ fontCode: FontCode, fontsize: CGFloat = 20, color: Color? = nil) -> Text {
        var shouldLoadFont = false
        #if os(iOS)
        shouldLoadFont = UIFont(name: fontCode.fontFamilyName, size: fontsize) == nil
        #else
        shouldLoadFont =  NSFont(name: fontCode.fontFamilyName, size: fontsize) == nil
        #endif
        if shouldLoadFont {
            FontLoader.loadFont(fontCode)
        }
        let text = Text(fontCode.code).font(.custom(fontCode.fontFamilyName, size: fontsize))
        
        return color == nil ? text : text.foregroundColor(color!)
    }
    
    public static func button(_ fontCode: FontCode, action: @escaping () -> Void, padding: CGFloat = 0, fontsize: CGFloat = 20, color: Color? = nil) -> some View {
        return button(fontCode, action: action, padding: .init(top: padding, leading: padding, bottom: padding, trailing: padding), fontsize: fontsize, color: color)
    }
    
    public static func button(_ fontCode: FontCode, action: @escaping () -> Void, padding: EdgeInsets, fontsize: CGFloat = 20, color: Color? = nil) -> some View {
        Button(action: action) {
            VStack{
                text(fontCode, fontsize: fontsize, color: color)
            }.padding(padding).contentShape(Rectangle())
        }.buttonStyle(PlainButtonStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading){
            FontIcon.text(.materialIcon(code: .access_alarm), fontsize: 30)
                .background(Color.red)
            FontIcon.text(.materialIcon(code: .access_alarm), fontsize: 30)
                .background(Color.red)
            FontIcon.button(.materialIcon(code: .person), action: {})
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
