//
//  NavigationStack.swift
//  WBSenior
//
//  Created by Александр Плетников on 21.07.2024.
//

import SwiftUI

final class NavigationStack: ObservableObject {
    @Published var screens: [Screen] = []
    @Published var hideBackButton: Bool = false

    func push<Content: View>(_ view: () -> Content, with animation: NavigationType) {
        let screen = Screen(id: UUID(), content: AnyView(view()), navigationType: animation)
        screens.append(screen)
    }

    func pop() {
        _ = screens.popLast()
    }

    func popToRoot() {
        screens.removeAll()
    }

    func replaceStack<Content: View>(with view: () -> Content, animation: NavigationType) {
        screens.removeAll()
        push(view, with: animation)
    }
}
