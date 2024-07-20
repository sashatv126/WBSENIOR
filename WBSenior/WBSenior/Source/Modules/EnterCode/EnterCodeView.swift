//
//  EnterCodeView.swift
//  WBSenior
//
//  Created by Александр Плетников on 17.07.2024.
//

import SwiftUI

struct EnterCodeView: View {

    // MARK: Properties
    @EnvironmentObject var navigationStack: NavigationStack
    @State private var model: PhoneCode = .init()
    @State private var isLoading: Bool = false
    @State private var timeCodeToUpdate = 60
    let phoneNumber: String

    // MARK: Body

    var body: some View {
        ZStack {
            VStack {
                AuthContainer {
                    VStack(spacing: 34) {
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
                }
            }

            if UIDevice.isIpad {
                VStack {
                    backButton
                        .padding(.top, 489)
                }
            }
        }

        .frame(maxHeight: .infinity)
        .onAppear {
            if UIDevice.isIpad {
                navigationStack.hideBackButton = true
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

    @ViewBuilder
    var backButton: some View {
        Button {
            navigationStack.pop()
        } label: {
            HStack {
                Image(ImageResource.arrrow)
                Text("Вернуться назад")
                    .foregroundColor(TextColor.white)
                    .font(BasicFont.body14)
            }
        }
    }
}
