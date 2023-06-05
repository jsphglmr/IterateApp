//
//  FileManager+DocumentsDirectory.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/3/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
