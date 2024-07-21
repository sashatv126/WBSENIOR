//
//  NavigationStackView.swift
//  WBSenior
//
//  Created by Александр Плетников on 21.07.2024.
//

import SwiftUI

struct NavigationStackView<RootView: View>: View {
    @ObservedObject private var navigationStack = NavigationStack()
    let rootView: RootView

    init(rootView: () -> RootView) {
        self.rootView = rootView()
    }

    var body: some View {
        ZStack {
            rootView
                .environmentObject(navigationStack)
                .zIndex(0)

            ForEach(Array(navigationStack.screens.enumerated()), id: \.offset) { index, screen in
                ZStack(alignment: .topLeading) {
                    if !navigationStack.hideBackButton {
                        backButton
                            .padding(.leading)
                            .zIndex(Double(index + 2))
                    }

                    screen.content
                        .environmentObject(navigationStack)
                        .zIndex(Double(index + 1))

                }
                .transition(transition(for: screen.navigationType))
            }
        }
    }

    private func transition(for navigationType: NavigationType) -> AnyTransition {
        switch navigationType {
            case .push:
                return .move(edge: .trailing)
            case .present:
                return .move(edge: .bottom)
            case .custom(let transition):
                return AnyTransition.asymmetric(insertion: transition, removal: .identity)
        }
    }

    @ViewBuilder
    private var backButton: some View {
        Button {
            navigationStack.pop()
        } label: {
            Image(ImageResource.arrrow)
                .resizable()
                .frame(width: 12, height: 20)
                .padding()
        }
    }
}
