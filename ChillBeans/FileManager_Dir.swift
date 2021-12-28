//
//  FileManager_Dir.swift
//  ChillBeans
//
//  Created by Shashank Indukuri on 12/28/21.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
