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

public struct FontIcon : View {
    
    let fontCode: FontCode
    var color: Color
    var fontsize = 20.0
    
    public init(_ font: FontCode, color: Color = .primary, fontsize: Double = 20) {
        self.fontCode = font
        self.color = color
        self.fontsize = fontsize
    }
    
    public var body: some View {
        #if os(iOS)
        FontIconUIKit(fontCode: fontCode, color: color, fontsize: fontsize).fixedSize()
        #else
        FontIconAppKit(fontCode: fontCode, color: color, fontsize: fontsize).fixedSize()
        #endif
    }
}

#if os(OSX)
public struct FontIconAppKit: NSViewRepresentable {
    public var fontCode: FontCode
    public var color: Color
    public var fontsize: Double
    
    public init(fontCode: FontCode, color: Color = .primary, fontsize: Double = 20) {
        self.fontCode = fontCode
        self.color = color
        self.fontsize = fontsize
    }
    
    public func makeNSView(context: Context) -> NSTextField {
        let tf = NSTextField()
        tf.isEditable = false
        tf.isBordered = false
        tf.isEnabled = false
        tf.isBezeled = false
        tf.textColor = .controlTextColor
        tf.backgroundColor = .clear
        tf.maximumNumberOfLines = 1
        tf.preferredMaxLayoutWidth = 30
        return tf
    }

    public func updateNSView(_ nsView: NSTextField, context: Context) {
        nsView.textColor = color.nsColor()
        nsView.stringValue = fontCode.code
        nsView.font = fontCode.systemFont(size: CGFloat(fontsize))
    }
}
#endif

#if os(iOS)
public struct FontIconUIKit: UIViewRepresentable {
    public var fontCode: FontCode
    public var color: Color
    public var fontsize: Double

    public init(fontCode: FontCode, color: Color = .primary, fontsize: Double = 20) {
        self.fontCode = fontCode
        self.color = color
        self.fontsize = fontsize
    }
    
    public func makeUIView(context: Context) -> UILabel {
        let tf = UILabel()
        tf.textAlignment = .center
        tf.backgroundColor = .clear
        return tf
    }

    public func updateUIView(_ nsView: UILabel, context: Context) {
        nsView.textColor = color.toUIColor()
        nsView.text = fontCode.code
        nsView.font = fontCode.systemFont(size: CGFloat(fontsize))
    }
}
#endif

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FontIcon(.materialIcon(code: .access_alarm), color: .pink, fontsize: 30)
        }.frame(width: 100, height: 100, alignment: .center)
    }
}
