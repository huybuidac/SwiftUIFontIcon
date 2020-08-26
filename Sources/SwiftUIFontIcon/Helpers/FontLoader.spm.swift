//
//  File.swift
//  
//
//  Created by Huy Bui Dac on 26/08/2020.
//

import Foundation

extension FontLoader {
    static func getFontPaths() -> [String] {
        return Bundle.module.paths(forResourcesOfType: "ttf", inDirectory: nil)
    }
}
