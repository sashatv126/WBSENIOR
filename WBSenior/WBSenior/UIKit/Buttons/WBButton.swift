//
//  WbButton.swift
//  WBSenior
//
//  Created by Александр Плетников on 01.07.2024.
//

import SwiftUI

public struct WBButton: View {

    // MARK: Properties

    private let title: String
    private let action: () -> ()

    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    // MARK: Body

    public var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(BasicFont.body16)
                .foregroundColor(.white)
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity)
                .background(BasicColor.purple)
                .cornerRadius(12, corners: .allCorners)
        }
    }
}
