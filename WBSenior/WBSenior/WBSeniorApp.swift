//
//  WBSeniorApp.swift
//  WBSenior
//
//  Created by Александр Плетников on 17.07.2024.
//

import SwiftUI

@main
struct WBSeniorApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                if UIDevice.isIpad {
                    Image(ImageName.authBackground)
                        .resizable()
                        .ignoresSafeArea(.all)
                }

                NavigationStackView {
                    ContainerView()
                        .environmentObject(LanguageManager())
                }
            }
        }
    }
}
