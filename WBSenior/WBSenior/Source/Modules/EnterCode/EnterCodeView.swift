//
//  EnterCodeView.swift
//  WBSenior
//
//  Created by Александр Плетников on 17.07.2024.
//

import SwiftUI

struct EnterCodeView: View {

    // MARK: Properties

    @State private var model: PhoneCode = .init()
    @State private var isLoading: Bool = false
    @State private var timeCodeToUpdate = 60
    let phoneNumber: String

    // MARK: Body

    var body: some View {

        AuthContainerView {
            if isLoading {
                ProgressView()
                    .controlSize(.large)
                    .foregroundStyle(BasicColor.white)
                    .tint(BasicColor.purple)
            } else {
                VStack(spacing: 16) {
                    Image(ImageName.letterIcon)
                        .frame(width: 40, height: 40)

                    title
                        .padding(.bottom, 24)

                    WBOTPTextField(
                        numberOfFields: 4,
                        text: $model.code,
                        state: model.textFieldState
                    )
                    .frame(height: 80)
                    .padding(.bottom, 30)
                    .overlay(alignment: .bottom) {
                        if model.textFieldState == .error {
                            errorTitle
                        }
                    }

                    TimerButtonView(timeRemaining: $timeCodeToUpdate) {
                        timeCodeToUpdate = 60
                    }

                    if !UIDevice.isIpad {
                        Spacer()
                    }

                    WBButton(title: "Авторизоваться") {
                        if model.textFieldState == .success {
                            isLoading = true
                        }
                    }
                }
            }

        }
        .hideKeyboardWithTapGesture()
    }
}

private extension EnterCodeView {

    @ViewBuilder
    var title: some View {
        Text(phoneNumber)
            .foregroundColor(TextColor.white)
            .font(BasicFont.title24)
    }

    @ViewBuilder
    var errorTitle: some View {
        Text("Неверный код")
            .foregroundColor(TextColor.red)
            .font(BasicFont.body14)
    }
}
