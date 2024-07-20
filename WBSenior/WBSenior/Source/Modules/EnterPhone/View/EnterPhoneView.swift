//
//  EnterPhoneView.swift
//  WBSenior
//
//  Created by Александр Плетников on 20.07.2024.
//

import SwiftUI

struct EnterPhoneView: View {
    @EnvironmentObject var navigationStack: NavigationStack
    @State private var phoneModel = PhoneNumber(phoneNumber: "")

    var body: some View {
        AuthContainer {
            VStack(spacing: .zero) {
                title
                
                avatar
                
                subTitle
                
                PhoneNumberTextField(model: $phoneModel)
                    .padding(.top, 16)
                    .padding(.bottom, 24)
                
                if !UIDevice.isIpad {
                    Spacer()
                }
                
                WBButton(title: "Запросить код") {
                    withAnimation {
                        if phoneModel.phoneIsValid {
                            navigationStack.push({
                                EnterCodeView(phoneNumber: phoneModel.maskedPhoneNumber.replacingOccurrences(of: " ", with: ""))
                            }, with: .present)
                        }
                    }
                }
            }
        }
        .hideKeyboardWithTapGesture()
    }
}

private extension EnterPhoneView {

    @ViewBuilder
    var title: some View {
        Text("Aвторизация")
            .foregroundColor(BasicColor.white)
            .font(BasicFont.title24)
    }

    @ViewBuilder
    var avatar: some View {
        Image("avatar")
            .frame(width: 96, height: 96)
            .background(Color.red)
            .clipShape(Circle())
            .padding(.top, 12)
    }

    @ViewBuilder
    var subTitle: some View {
        Text("Вход по номеру телефона")
            .foregroundColor(BasicColor.white)
            .font(BasicFont.body16)
    }
}

#Preview {
    EnterPhoneView()
}
