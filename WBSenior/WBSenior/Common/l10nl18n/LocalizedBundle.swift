//
//  LocalizedBundle.swift
//  WBSenior
//
//  Created by Александр Плетников on 21.07.2024.
//

import Foundation

final class LocalizedBundle {
    static let shared = LocalizedBundle()

    private var bundle: Bundle

    private init() {
        self.bundle = Bundle.main
    }

    func setLanguage(_ language: String) {
        if let path = Bundle.main.path(forResource: language, ofType: "lproj"),
           let newBundle = Bundle(path: path) {
            self.bundle = newBundle
        } else {
            self.bundle = Bundle.main
        }
    }

    func localizedString(forKey key: String) -> String {
        return bundle.localizedString(
            forKey: key,
            value: nil,
            table: nil
        )
    }
}

