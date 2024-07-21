//
//  LanguageManager.swift
//  WBSenior
//
//  Created by Александр Плетников on 21.07.2024.
//

import Combine

final class LanguageManager: ObservableObject {

    @Published var currentLanguage: String = "en" {
        didSet {
            LocalizedBundle.shared.setLanguage(currentLanguage)
        }
    }
}
