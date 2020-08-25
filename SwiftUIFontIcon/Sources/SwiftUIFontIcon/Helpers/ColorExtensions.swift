//
//  File.swift
//  
//
//  Created by Huy Bui Dac on 25/08/2020.
//
#if os(iOS)
import UIKit
#else
import AppKit
#endif
import Foundation
import SwiftUI


extension String {
    func rgbColor() -> (red: CGFloat, green: CGFloat, blue: CGFloat)? {
        var hexadecimal = self
            .trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            .uppercased()
        
        if hexadecimal.hasPrefix("#") {
            hexadecimal = String(hexadecimal.dropFirst())
        }
        
        guard hexadecimal.count == 6 else {
            return nil
        }
        
        var rgbValue: UInt64 = 0
        
        Scanner(string: hexadecimal).scanHexInt64(&rgbValue)
        
        return (
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0
        )
    }
}

extension Color {
    #if os(iOS)
    private func toUIColor0() -> UIColor? {
        switch self {
        case .accentColor:
            return .label
        case .clear:
            return .clear
        case .black:
            return .black
        case .white:
            return .white
        case .gray:
            return .systemGray
        case .red:
            return .systemRed
        case .green:
            return .systemGreen
        case .blue:
            return .systemBlue
        case .orange:
            return .systemOrange
        case .yellow:
            return .systemYellow
        case .pink:
            return .systemPink
        case .primary:
            return .label // FIXME?
        case .secondary:
            return .secondaryLabel // FIXME?
        default:
            return nil
        }
    }
    
    private func toUIColor1() -> UIColor? {
        switch self {
        case .clear:
            return UIColor.clear
        case .black:
            return UIColor.black
        case .white:
            return UIColor.white
        case .gray:
            return UIColor.systemGray
        case .red:
            return UIColor.systemRed
        case .green:
            return UIColor.systemGreen
        case .blue:
            return UIColor.systemBlue
        case .orange:
            return UIColor.systemOrange
        case .yellow:
            return UIColor.systemYellow
        case .pink:
            return UIColor.systemPink
        case .purple:
            return UIColor.systemPurple
        case .primary:
            return UIColor.label
        case .secondary:
            return UIColor.secondaryLabel
        default:
            return nil
        }
    }
    
    private func toUIColor2() -> UIColor? {
        let children = Mirror(reflecting: self).children
        let _provider = children.filter { $0.label == "provider" }.first
        
        guard let provider = _provider?.value else {
            return nil
        }
        
        let providerChildren = Mirror(reflecting: provider).children
        let _base = providerChildren.filter { $0.label == "base" }.first
        
        guard let base = _base?.value else {
            return nil
        }
        
        if String(describing: type(of: base)) == "NamedColor" {
            let baseMirror = Mirror(reflecting: base)
            
            if let name = baseMirror.descendant("name") as? String {
                let bundle = baseMirror.descendant("bundle") as? Bundle
                if let color = UIColor(named: name, in: bundle, compatibleWith: nil) {
                    return color
                }
            }
        }
        
        var baseValue: String = ""
        
        dump(base, to: &baseValue)
        
        guard let firstLine = baseValue.split(separator: "\n").first, let hexString = firstLine.split(separator: " ")[1] as Substring? else {
            return nil
        }
        
        guard let rgb = hexString.trimmingCharacters(in: .newlines).rgbColor() else {
            return nil
        }
        
        return UIColor(red: rgb.red, green: rgb.green, blue: rgb.blue, alpha: 1.0)
    }
    
    public func toUIColor3() -> UIColor? {
        switch description {
        case "clear":
            return UIColor.clear
        case "black":
            return UIColor.black
        case "white":
            return UIColor.white
        case "gray":
            return UIColor.systemGray
        case "red":
            return UIColor.systemRed
        case "green":
            return UIColor.systemGreen
        case "blue":
            return UIColor.systemBlue
        case "orange":
            return UIColor.systemOrange
        case "yellow":
            return UIColor.systemYellow
        case "pink":
            return UIColor.systemPink
        case "purple":
            return UIColor.systemPurple
        case "primary":
            return UIColor.label
        case "secondary":
            return UIColor.secondaryLabel
        default:
            return nil
        }
    }
    
    public func toUIColor() -> UIColor? {
        #if swift(>=5.3)
        #if os(iOS)
        if #available(iOS 14.0, *) {
            return UIColor(self)
        }
        #elseif os(tvOS)
        if #available(tvOS 14.0, *) {
            return UIColor(self)
        }
        #endif
        #endif
        
        return toUIColor0()
            ?? toUIColor1()
            ?? toUIColor2()
            ?? toUIColor3()
    }
    #endif
    
    #if os(macOS)
    private func nsColor0() -> NSColor? {
        switch self {
        case .accentColor:
            return .controlAccentColor
        case .clear:
            return .clear
        case .black:
            return .black
        case .white:
            return .white
        case .gray:
            return .systemGray
        case .red:
            return .systemRed
        case .green:
            return .systemGreen
        case .blue:
            return .systemBlue
        case .orange:
            return .systemOrange
        case .yellow:
            return .systemYellow
        case .pink:
            return .systemPink
        case .primary:
            return .labelColor // FIXME?
        case .secondary:
            return .secondaryLabelColor // FIXME?
        default:
            return nil
        }
    }
    
    private func nsColor1() -> NSColor? {
        switch self {
        case .clear:
            return NSColor.clear
        case .black:
            return NSColor.black
        case .white:
            return NSColor.white
        case .gray:
            return NSColor.systemGray
        case .red:
            return NSColor.systemRed
        case .green:
            return NSColor.systemGreen
        case .blue:
            return NSColor.systemBlue
        case .orange:
            return NSColor.systemOrange
        case .yellow:
            return NSColor.systemYellow
        case .pink:
            return NSColor.systemPink
        case .purple:
            return NSColor.systemPurple
        case .primary:
            return NSColor.labelColor
        case .secondary:
            return NSColor.secondaryLabelColor
        default:
            return nil
        }
    }
    
    private func nsColor2() -> NSColor? {
        let children = Mirror(reflecting: self).children
        let _provider = children.filter { $0.label == "provider" }.first
        
        guard let provider = _provider?.value else {
            return nil
        }
        
        let providerChildren = Mirror(reflecting: provider).children
        let _base = providerChildren.filter { $0.label == "base" }.first
        
        guard let base = _base?.value else {
            return nil
        }
        
        if String(describing: type(of: base)) == "NamedColor" {
            let baseMirror = Mirror(reflecting: base)
            
            if let name = baseMirror.descendant("name") as? String {
                let bundle = baseMirror.descendant("bundle") as? Bundle
                if let color = NSColor(named: name, bundle: bundle) {
                    return color
                }
            }
        }
        
        var baseValue: String = ""
        
        dump(base, to: &baseValue)
        
        guard let firstLine = baseValue.split(separator: "\n").first, let hexString = firstLine.split(separator: " ")[1] as Substring? else {
            return nil
        }
        
        guard let rgb = hexString.trimmingCharacters(in: .newlines).rgbColor() else {
            return nil
        }
        
        return NSColor(red: rgb.red, green: rgb.green, blue: rgb.blue, alpha: 1.0)
    }
    
    public func nsColor3() -> NSColor? {
        switch description {
        case "clear":
            return .clear
        case "black":
            return .black
        case "white":
            return .white
        case "gray":
            return .systemGray
        case "red":
            return .systemRed
        case "green":
            return .systemGreen
        case "blue":
            return .systemBlue
        case "orange":
            return .systemOrange
        case "yellow":
            return .systemYellow
        case "pink":
            return .systemPink
        case "purple":
            return .systemPurple
        case "primary":
            return .labelColor
        case "secondary":
            return .secondaryLabelColor
        default:
            return nil
        }
    }
    
    public func nsColor() -> NSColor? {
        #if swift(>=5.3)
        #if os(iOS)
        if #available(macOS 10.16, *) {
            return NSColor(self)
        }
        #endif
        #endif
        
        return nsColor0()
            ?? nsColor1()
            ?? nsColor2()
            ?? nsColor3()
    }
    #endif
}
