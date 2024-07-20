//
//  Screen.swift
//  WBSenior
//
//  Created by Александр Плетников on 21.07.2024.
//

import SwiftUI

struct Screen: Identifiable, Equatable, Hashable {
    let id: UUID
    let content: AnyView
    let navigationType: NavigationType

    static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
