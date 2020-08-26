#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif
import Foundation

public enum FontCode {
    case awesome5Solid(code: FontAwesomeCode)
    case ionicon(code: IonIconsCode)
    case materialIcon(code: MaterialIconCode)

    var fontFamilyName: String {
        switch self {
        case .awesome5Solid:
            return "Font Awesome 5 Free"
        case .ionicon:
            return "Ionicons"
        case .materialIcon:
            return "Material Icons"
        }
    }
    
    var fileName: String {
        switch self {
        case .awesome5Solid:
            return "FontAwesome5Free-Solid"
        case .ionicon:
            return "Ionicons"
        case .materialIcon:
            return "MaterialIcons-Regular"
        }
    }
    
    var code: String {
        switch self {
        case .awesome5Solid(code: let code):
            return code.rawValue
        case .ionicon(code: let code):
            return code.rawValue
        case .materialIcon(code: let code):
            return code.rawValue
        }
    }
}

public extension FontCode {
    #if os(iOS)
    func systemFont(size: CGFloat) -> UIFont {
        if (UIFont.fontNames(forFamilyName: self.fontFamilyName).count == 0)
        {
            FontLoader.loadFont(self)
        }
        return UIFont(name: self.fileName, size: size)!
    }
    #else
    func systemFont(size: CGFloat) -> NSFont {
        if !loadedFonts.contains(where: {$0.fontFamilyName == self.fontFamilyName}) {
            FontLoader.loadFont(self)
        }
        return NSFont(name: self.fileName, size: size)!
    }
    #endif
}

var loadedFonts = [FontCode]()

class FontLoader: NSObject {
    class func loadFont(_ fontCode: FontCode) {
        let fontName = fontCode.fileName
        let paths = self.getFontPaths()
        var fontURL = URL(string: "")
        var error: Unmanaged<CFError>?

        paths.forEach {
            guard let filename = NSURL(fileURLWithPath: $0).lastPathComponent,
                filename.lowercased().range(of: fontName.lowercased()) != nil else {
                    return
            }

            fontURL = NSURL(fileURLWithPath: $0) as URL
        }

        guard let unwrappedFontURL = fontURL,
            let data = try? Data(contentsOf: unwrappedFontURL),
            let provider = CGDataProvider(data: data as CFData) else {
                return
        }

        let font = CGFont.init(provider)

        guard let unwrappedFont = font,
            !CTFontManagerRegisterGraphicsFont(unwrappedFont, &error),
            let unwrappedError = error,
            let nsError = (unwrappedError.takeUnretainedValue() as AnyObject) as? NSError else {
            loadedFonts.append(fontCode)
            return
        }

        let errorDescription: CFString = CFErrorCopyDescription(unwrappedError.takeUnretainedValue())

        NSException(name: NSExceptionName.internalInconsistencyException,
                    reason: errorDescription as String,
                    userInfo: [NSUnderlyingErrorKey: nsError]).raise()
    }
}
