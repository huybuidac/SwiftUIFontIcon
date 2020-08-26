//
//  File.swift
//  
//
//  Created by Huy Bui Dac on 26/08/2020.
//

import Foundation

extension FontLoader {
    static func getFontPaths() -> [String] {
        let bundle = Bundle(for: FontLoader.self)
        return bundle.paths(forResourcesOfType: "ttf", inDirectory: nil)
    }
}
