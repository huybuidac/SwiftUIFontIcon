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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading){
            FontIcon.text(.materialIcon(code: .align_horizontal_center), fontsize: 30)
            FontIcon.text(.materialIcon(code: .access_alarm), fontsize: 30)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
